defmodule Gottex.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Bcrypt

  @permitted_params ~w/name email password/a

  @primary_key {:id, :binary_id, autogenerate: true}

  @derive {Jason.Encoder, only: ~w/name email/a ++ [:id]}

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :recovery_code, :string

    has_many :contacts, Gottex.Contact

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @permitted_params)
    |> unique_constraint(:email)
    |> validate_required(@permitted_params)
    |> validate_length(:password, min: 6)
    |> validate_format(:email, ~r/@/)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes:
    %{password: password}} = changeset) do
    change(changeset, add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
