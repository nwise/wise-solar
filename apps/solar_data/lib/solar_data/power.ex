defmodule SolarData.Power do
  use SolarData.Components, :model

  schema "power" do
    field :time, Timex.Ecto.DateTime
    field :value, :float

    timestamps()
  end

  def changeset(params) do
    changeset(__MODULE__.__struct__, params)
  end

  def changeset(model, params) do
    model
    |> cast(params, [:time, :value])
    |> unique_constraint(:time)
  end

end
