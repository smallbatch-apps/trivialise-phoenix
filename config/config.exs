# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :trivialise,
  ecto_repos: [Trivialise.Repo]

# Configures the endpoint
config :trivialise, TrivialiseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eT/jzT2uElKULOmtksuX1dQDckl13g8u2TGhkHU44SDRhJXwqKpSp+Khq+vDCr5V",
  render_errors: [view: TrivialiseWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Trivialise.PubSub,
  live_view: [signing_salt: "YWLwYgsi"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
