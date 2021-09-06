defmodule GottexWeb.AuthController do
  use GottexWeb, :controller

  action_fallback GottexWeb.FallbackController

  def login(conn, params) do
    with {:ok, user} <- Gottex.authenticate_user(params),
         {:ok, token, _claims} <- GottexWeb.Auth.Guardian.encode_and_sign(user)
      do

      conn
      |> put_status(:ok)
      |> render("login.json", %{user: user, token: token})
    end
  end

  def request_code_recovery_password(conn, params) do
    with {:ok, _user} <- Gottex.request_code_recovery_password(params) do
    conn
    |> put_status(:ok)
    |> render("request_code_recovery_password.json")
    end
  end

  def recover_password(conn, params) do
    with {:ok, user} <- Gottex.recover_password(params) do
    conn
    |> put_status(:ok)
    |> render("recover_password.json", %{user: user})
    end
  end
end
