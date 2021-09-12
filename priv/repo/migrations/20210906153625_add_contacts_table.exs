defmodule Gottex.Repo.Migrations.AddContactsTable do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :name, :string
      add :phone_number, :string
      add :user_id, references(:users)

      timestamps()
    end

    create unique_index(:contacts, [:phone_number])
  end
end
