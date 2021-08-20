defmodule GottexWeb.UsersController do
  use GottexWeb, :controller


  def create(conn, params) do
    with {:ok, user} <- Gottex.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
