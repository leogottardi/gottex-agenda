defmodule Gottex.User.Create do
  alias Gottex.{User, Repo}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
