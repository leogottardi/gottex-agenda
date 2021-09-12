defmodule Gottex.ContactTest do
  use ExUnit.Case, async: true
  use Gottex.DataCase

  alias Gottex.{Contact, User}

  describe "Contacts C.R.U.D" do
    test "changeset/1, will a valid params return a valid changeset" do
      user_params = %{name: "Leonardo", email: "leomgottardi@gmail.com", password: "123456"}

      {:ok, user} = User.Create.call(user_params)

      contact_params = %{name: "Lucas", phone_number: "992842391", user_id: user.id}

      contact = Contact.changeset(contact_params)

      assert %Ecto.Changeset{valid?: true} = contact
    end

    test "changeset/1, will a invalid user_id return a invalid changeset" do
      contact_params = %{name: "Lucas", phone_number: "992842391", user_id: 1234}

      contact = Contact.changeset(contact_params)

      assert  %Ecto.Changeset{
        changes: %{name: "Lucas", phone_number: "992842391"},
        errors: [user_id: {"is invalid", [type: :binary_id, validation: :cast]}],
        valid?: false
       } = contact
    end

    test "create/1, will a valid params create a contact" do
      user_params = %{name: "Leonardo", email: "leomgottardi@gmail.com", password: "123456"}

      {:ok, user} = User.Create.call(user_params)

      contact_params = %{name: "Lucas", phone_number: "992842391", user_id: user.id}

      {:ok, contact} = Contact.Create.call(contact_params)

      assert %Contact{name: "Lucas"} = contact
    end
  end
end
