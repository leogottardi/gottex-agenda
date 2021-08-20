defmodule Gottex.UserTest do
  use ExUnit.Case

  alias Gottex.User

  describe "User test's" do

    test "changeset/1, will a valid params return a valid changeset" do
      params = %{name: "Leonardo", email: "leomgottardi@gmail.com", password: "123456"}

      user = User.changeset(params)

      assert %Ecto.Changeset{
                            changes: %{
                              name: "Leonardo",
                              email: "leomgottardi@gmail.com",
                              password_hash: _password_hash
                              },
                            valid?: true
                          } = user
    end

  end
end
