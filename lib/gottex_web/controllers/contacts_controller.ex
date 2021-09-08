defmodule GottexWeb.ContactsController do
  use GottexWeb, :controller

  alias Gottex.Contact.Struct, as: ContactStruct

  action_fallback GottexWeb.FallbackController

  def create(conn, params) do
    with {:ok, user, _claims} <- GottexWeb.Auth.Guardian.get_resource_from_token(conn),
         %ContactStruct{} = contact_struct <- ContactStruct.build(params, user.id),
         {:ok, contact} <- Gottex.create_contact(Map.from_struct(contact_struct))
      do

      conn
      |> put_status(:created)
      |> render("create.json", %{contact: contact})
    end
  end
end
