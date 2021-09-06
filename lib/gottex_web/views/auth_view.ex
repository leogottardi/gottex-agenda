defmodule GottexWeb.AuthView do
  use GottexWeb, :view

  def render("login.json", %{user: user, token: token}) do
    %{
      user: user,
      token: token
    }
  end

  def render("request_code_recovery_password.json", _) do
    %{
      message: "Sucessfull request recover password!!"
    }
  end

  def render("recover_password.json", %{user: user}) do
    %{
      user: user
    }
  end
end
