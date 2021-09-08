defmodule GottexWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    module: GottexWeb.Auth.Guardian,
    otp_app: :gottex,
    error_handler: GottexWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
  plug Guardian.Plug.EnsureAuthenticated
end
