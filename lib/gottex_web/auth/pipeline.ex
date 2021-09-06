defmodule GottexWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    module: GottexWeb.Auth.Guardianclear,
    otp_app: :gottex,
    error_handler: GottexWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
