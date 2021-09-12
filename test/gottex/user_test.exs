defmodule Gottex.UserTest do
  use ExUnit.Case, async: true
  use Gottex.DataCase

  alias Gottex.User

  describe "Users C.R.U.D" do

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

    test "create/1, will a valid params return a valid user" do
      params = %{name: "Leonardo", email: "leomgottardi@gmail.com", password: "123456"}

      user = User.Create.call(params)

      assert {:ok, %Gottex.User{
                                id: _id,
                                email: "leomgottardi@gmail.com",
                                name: _name,
                                password_hash: _password_hash
                              }} = user
    end

    test "get/1, will a valid params return a valid user" do
      params = %{name: "Leonardo", email: "leomgottardi@gmail.com", password: "123456"}

      {:ok, create_user} = User.Create.call(params)

      user = User.Get.call(%{"email" => create_user.email})

      assert {:ok, %Gottex.User{
                          email: "leomgottardi@gmail.com",
                          name: "Leonardo",
                          password_hash: _password_hash,
                          recovery_code: nil
                        }} = user
    end
  end
end
