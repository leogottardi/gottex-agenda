defmodule GottexWeb.UsersView do
  use GottexWeb, :view

  def render("create.json", %{user: user}) do
    %{
      user: %{
        name: user.name,
        email: user.email
      }
    }
  end
end
