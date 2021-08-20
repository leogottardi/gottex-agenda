# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gottex,
  ecto_repos: [Gottex.Repo]


config :gottex, Gottex.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :gottex, GottexWeb.Auth.Guardian,
  issuer: "gottex",
  secret_key: "SMQDcNz+EzUTgBnjySYu4VaEaybtFFWPzmN4MUAhgi1YZD+nnL3BmYCVFunXYh4P"

config :gottex, GottexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Sa8QWmlsIg9jdrTVNBJyh71eqKhuD5GlE4IhJSRpxeYgEH0kNesKfcnaAi0GvskD",
  render_errors: [view: GottexWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Gottex.PubSub,
  live_view: [signing_salt: "7CyBpVvT"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
