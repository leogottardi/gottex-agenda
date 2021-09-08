defmodule GottexWeb.Auth.Guardian do
  use Guardian, otp_app: :gottex

  import Plug.Conn

  def subject_for_token(%{id: id}, _claims) do
    sub = to_string(id)
    {:ok, sub}
  end

  def resource_from_claims(%{"sub" => id}) do
    resource = Gottex.Repo.get(Gottex.User, id)
    {:ok,  resource}
  end

  def get_resource_from_token(conn) do
      conn
      |> Guardian.Plug.current_token()
      |> resource_from_token()
  end
end
