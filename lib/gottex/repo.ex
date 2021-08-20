defmodule Gottex.Repo do
  use Ecto.Repo,
    otp_app: :gottex,
    adapter: Ecto.Adapters.Postgres
end
