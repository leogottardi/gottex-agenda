defmodule Gottex.Auth.RecoverPassword.RequestCodeRecoveryPassword do
  import Ecto.Changeset
  alias Gottex.User.Get, as: GetUser
  alias Gottex.Repo

  def call(params) do
    params
    |> GetUser.call()
    |> send_recovery_code()
  end

  defp send_recovery_code({:ok, user}) do
    code = generate_random_code()

    user
    |> change(recovery_code: code)
    |> Repo.update()
  end

  defp send_recovery_code(error), do: error

  defp generate_random_code do
    :rand.uniform * 10000
    |> :erlang.float_to_binary([decimals: 0])
  end
end
