defmodule SolarData.Api.Power do

  def get do
    end_time = Timex.now
    start_time = Timex.shift(end_time, days: -7)

    get(start_time, end_time)
  end

  def get(start_time, end_time) do
    start_time = Timex.format!(start_time, "%F %T", :strftime)
    end_time = Timex.format!(end_time, "%F %T", :strftime)

    query_params = %{"startTime" => start_time, "endTime" => end_time}

    {:ok, response} = HTTPoison.get "#{url}?#{query(query_params)}"
  end

  defp url do
    "#{base_url()}/site/#{site_id()}/power"
  end

  defp site_id do
    Application.get_env(:solar_data, :solar_edge_api)[:site_id]
  end

  defp api_key do
    Application.get_env(:solar_data, :solar_edge_api)[:api_key]
  end

  defp base_url do
    Application.get_env(:solar_data, :solar_edge_api)[:url]
  end

  defp query(params \\ %{}) do
    params
    |> Map.merge(%{api_key: api_key})
    |> URI.encode_query
  end

end
