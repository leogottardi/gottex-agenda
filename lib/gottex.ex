defmodule Gottex do
  alias Gottex.{User, Auth, Contact}
  alias Gottex.Auth.RecoverPassword

  # Users
  defdelegate create_user(params), to: User.Create, as: :call
  defdelegate get_user(params), to: User.Get, as: :call

  # Auth
  defdelegate authenticate_user(params), to: Auth.Authentication, as: :call
  defdelegate request_code_recovery_password(params), to: RecoverPassword.RequestCodeRecoveryPassword, as: :call
  defdelegate recover_password(params), to: RecoverPassword.RecoverPassword, as: :call

  # Contact
  defdelegate create_contact(params), to: Contact.Create, as: :call
end
