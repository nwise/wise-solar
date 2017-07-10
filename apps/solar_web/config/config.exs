# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :solar_web,
  ecto_repos: [SolarWeb.Repo]

# Configures the endpoint
config :solar_web, SolarWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UvfCyZ9SWFox5kfRqvq+SzNrm2zBTSbPFy9ocN6d6j2CqApxzKHr1POayrcFnHrc",
  render_errors: [view: SolarWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SolarWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
