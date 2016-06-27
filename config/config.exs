# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :chatrocket,
  ecto_repos: [Chatrocket.Repo]

# Configures the endpoint
config :chatrocket, Chatrocket.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vXQupkdMamDZKCzqqnZG4htK91pXHJorBwp+zWh0kInsAlMg7SWj1Lqd7OM61l7Q",
  render_errors: [view: Chatrocket.ErrorView, accepts: ~w(json)],
  pubsub: [name: Chatrocket.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :format_encoders, "json-api": Poison

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
