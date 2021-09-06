defmodule GottexWeb.AuthController do
  use GottexWeb, :controller

  action_fallback GottexWeb.FallbackController

  def login(conn, params) do
    with {:ok, user} <- Gottex.Auth.Authentication.call(params),
          {:ok, token, _claims} <- GottexWeb.Auth.Guardian.encode_and_sign(user)
      do

      conn
      |> put_status(:ok)
      |> render("login.json", %{user: user, token: token})
    end
  end
end
