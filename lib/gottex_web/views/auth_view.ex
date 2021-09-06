defmodule GottexWeb.AuthView do
  use GottexWeb, :view

  def render("login.json", %{user: user, token: token}) do
    %{
      user: user,
      token: token
    }
  end
end
