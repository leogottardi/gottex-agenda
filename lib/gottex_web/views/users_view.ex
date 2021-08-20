defmodule GottexWeb.UsersView do
  use GottexWeb, :view

  def render("create.json", %{user: user, token: token}) do
    %{
      user: %{
        name: user.name,
        email: user.email
      },
      token: token
    }
  end
end
