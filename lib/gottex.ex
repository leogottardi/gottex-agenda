defmodule Gottex do
  alias Gottex.User
  defdelegate create_user(params), to: User.Create, as: :call
end
