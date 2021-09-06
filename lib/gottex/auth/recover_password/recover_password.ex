defmodule Gottex.Auth.RecoverPassword.RecoverPassword do
  alias Gottex.User.Get, as: GetUser
  alias Gottex.Repo

  def call(params) do
    params
    |> GetUser.call()
    |> validate_code(params)
  end

  defp validate_code({:ok,
    %Gottex.User{recovery_code: recovery_code} = user},
    %{"recovery_code" => code, "new_password" => new_password}) do

      case recovery_code === code and recovery_code != nil do
        true -> change_password(user, new_password)

        false -> {:error, "Recovery code is invalid!"}
      end
  end

  defp validate_code(error, _params), do: error

  defp change_password(user, new_password) do
    user
    |> Gottex.User.changeset(%{password: new_password, recovery_code: nil})
    |> Repo.update()
  end
end
