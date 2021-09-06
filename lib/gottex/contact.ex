defmodule Gottex.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  @permitted_params ~w/name phone_number user_id/a

  @primary_key {:id, :binary_id, autogenerate: true}

  @foreign_key_type :binary_id

  schema "contacts" do
    field :name, :string
    field :phone_number, :string
    belongs_to :user, Gottex.User

    timestamps()
  end

  def changeset(contact \\ %__MODULE__{}, params) do
    contact
    |> cast(params, @permitted_params)
    |> validate_length(:phone_number, min: 9, max: 9)
  end
end
