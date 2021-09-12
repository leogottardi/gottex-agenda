defmodule GottexWeb.ContactsView do
  use GottexWeb, :view

  def render("index.json", %{user: user}) do
    %{
      user: %{
        name: user.name,
        email: user.email,
        contacts: user.contacts
      }
    }
  end

  def render("create.json", %{contact: contact}) do
    %{
      contact: contact
    }
  end
end
