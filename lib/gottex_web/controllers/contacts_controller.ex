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
end
