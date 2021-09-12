defmodule Gottex.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  @permitted_params ~w/name phone_number user_id/a

  @primary_key {:id, :binary_id, autogenerate: true}

  @foreign_key_type :binary_id

  @derive {Jason.Encoder, only: ~w/id name phone_number/a}

  schema "contacts" do
    field :name, :string
    field :phone_number, :string
    belongs_to :user, Gottex.User

    timestamps()
  end

  def changeset(contact \\ %__MODULE__{}, params) do
    contact
    |> cast(params, @permitted_params)
    |> validate_required(@permitted_params)
    |> validate_length(:phone_number, min: 9, max: 9)
    |> unique_constraint(:phone_number)
    |> foreign_key_constraint(:user_id)
  end
end
