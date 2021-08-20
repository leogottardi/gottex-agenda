defmodule GottexWeb.UsersController do
  use GottexWeb, :controller


  def create(conn, params) do
    with {:ok, user} <- Gottex.create_user(params),
         {:ok, token, _claims} <- GottexWeb.Auth.Guardian.encode_and_sign(user)
        do
      conn
      |> put_status(:created)
        |> render("create.json", %{user: user, token: token})
    end
  end
end
