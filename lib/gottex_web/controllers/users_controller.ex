defmodule GottexWeb.UsersController do
  use GottexWeb, :controller

  action_fallback GottexWeb.FallbackController


  def create(conn, params) do
    with {:ok, user} <- Gottex.create_user(params),
         {:ok, token, _claims} <- GottexWeb.Auth.Guardian.encode_and_sign(user)
        do
      conn
      |> put_status(:created)
        |> render("create.json", %{user: user, token: token})
    end
  end

  def show(conn, params) do
    with {:ok, user} <- Gottex.get_user(params) do
      conn
      |> put_status(:ok)
      |> render("show.json", user: user)
    end
  end
end
