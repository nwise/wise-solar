require IEx
defmodule Mix.Tasks.InitialDataLoad do
  use Mix.Task

  @shortdoc "Loads initial Data"
  def run(_) do
    # {:ok,  _} = Application.ensure_all_started :timex
    Mix.Task.run "app.start", []

    File.ls("priv/raw_data")
    |> elem(1)
    |> Enum.filter(&(Regex.match?(~r/.csv$/, &1)))
    |> Enum.map(&(process_file("priv/raw_data/#{&1}")))
  end

  def load_files(path) do

  end

  def process_file(file) do
    File.stream!(file)
    |> CSV.decode!(headers: true)
    |> Enum.each(&(persist_data(&1)))
  end

  def persist_data(data) do
    %{
      value: data["System Production (W)"],
      time: Timex.parse!(data["Time"], "%m/%d/%Y %k:%M", :strftime)
    }
    |> SolarData.Power.changeset
    |> SolarData.Repo.insert!
  end
end
