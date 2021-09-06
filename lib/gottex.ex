defmodule Gottex do
  alias Gottex.{User, Auth}

  defdelegate create_user(params), to: User.Create, as: :call
  defdelegate get_user(params), to: User.Get, as: :call
  defdelegate authenticate_user(params), to: Auth.Authentication, as: :call
end
