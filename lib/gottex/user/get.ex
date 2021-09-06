defmodule Gottex.User.Get do
  alias Gottex.{User, Repo}

  def call(params) do
    params
    |> handle_get()
  end

  defp handle_get(%{"id" => id}), do: validate_uuid(id)

  defp validate_uuid(id) do
    case Ecto.UUID.cast(id) do
      {:ok, uuid} -> find_user({:ok, uuid})
      :error -> {:error, "ID não é um UUID"}
    end
  end

  defp find_user({:ok, uuid}) do
    case Repo.get(User, uuid) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
