defmodule GottexWeb.ContactsView do
  use GottexWeb, :view

  def render("create.json", %{contact: contact}) do
    %{
      contact: contact
    }
  end
end
