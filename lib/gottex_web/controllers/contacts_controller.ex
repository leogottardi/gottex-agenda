defmodule GottexWeb.ContactsController do
  use GottexWeb, :controller

  action_fallback GottexWeb.FallbackController

  def create(conn, params) do
    with {:ok, user, _claims} <- GottexWeb.Auth.Guardian.get_resource_from_token(conn),
         contact_params <- Map.put(params, "user_id", user.id),
         {:ok, contact} <- Gottex.create_contact(contact_params)
      do

      conn
      |> put_status(:created)
      |> render("create.json", %{contact: contact})
    end
  end

  def index(conn, _params) do
    with {:ok, user, _claims} <- GottexWeb.Auth.Guardian.get_resource_from_token(conn),
        user_with_contacts <- user |> Gottex.Repo.preload(:contacts)
      do
        conn
        |> put_status(:ok)
        |> render("index.json", %{user: user_with_contacts})
      end
  end
end
