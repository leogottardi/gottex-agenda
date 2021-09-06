defmodule Gottex.Auth.Authentication do
  alias Gottex.User
  def call(params) do
    params
    |> User.Get.call()
    |> validate_password(params)
  end

  defp validate_password({:error, _message} = error, _params), do: error

  defp validate_password({:ok, user}, %{"password" => password}) do
    case Bcrypt.check_pass(user, password) do
      {:ok, user} -> {:ok, user}
      error -> error
    end
  end
end
