defmodule Gottex.Contact.Struct do
  @keys [:name, :phone_number, :user_id]

  @enforce_keys @keys
  defstruct @keys

  def build(%{"name" => name, "phone_number" => phone_number}, user_id) do
    %__MODULE__{
      name: name,
      phone_number: phone_number,
      user_id: user_id
    }
  end
end
