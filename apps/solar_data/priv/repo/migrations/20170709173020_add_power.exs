defmodule SolarData.Repo.Migrations.AddPower do
  use Ecto.Migration

  def change do

    create table(:power) do
      add :time, :utc_datetime
      add :value, :float

      timestamps()
    end

  end
end
