# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :retro_game_log,
  ecto_repos: [RetroGameLog.Repo]

# Configures the endpoint
config :retro_game_log, RetroGameLogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TvVgT6Dy7XAG0oC0G2AScU6J3HM2Y1xlTCr/sYZvnhuK30mLKKK2GOfkhVKzixes",
  render_errors: [view: RetroGameLogWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: RetroGameLog.PubSub, adapter: Phoenix.PubSub.PG2]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
