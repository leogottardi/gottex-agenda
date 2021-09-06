defmodule Gottex.User.Get do
  alias Gottex.{User, Repo}

  def call(params) do
    params
    |> handle_get()
  end

  defp handle_get(%{"id" => id}), do: validate_uuid(id)
  defp handle_get(%{"email" => email}), do: find_user({:ok, :email, email})

  defp validate_uuid(id) do
    case Ecto.UUID.cast(id) do
      {:ok, uuid} -> find_user({:ok, :id, uuid})
      :error -> {:error, "ID não é um UUID"}
    end
  end

  defp find_user({:ok, :id, uuid}) do
    case Repo.get(User, uuid) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  defp find_user({:ok, :email, email}) do
    case Repo.get_by(User, %{email: email}) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
