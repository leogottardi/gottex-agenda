defmodule Gottex.Contact.Create do
  alias Gottex.{Contact, Repo}

  def call(params) do
    IO.inspect(params)

    
    params
    |> Contact.changeset()
    |> Repo.insert()
  end
end
