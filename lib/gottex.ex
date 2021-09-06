defmodule Gottex do
  alias Gottex.User

  defdelegate create_user(params), to: User.Create, as: :call
  defdelegate get_user(params), to: User.Get, as: :call
end
