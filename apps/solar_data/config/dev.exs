use Mix.Config

config :solar_data, SolarData.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "solar_data_dev",
  username: "nathanwise",
  password: ""
