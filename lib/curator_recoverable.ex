defmodule CuratorRecoverable do
  @moduledoc """
  CuratorRecoverable: A curator module to handle user "forgotten password".
  """

  if !(
       (Application.get_env(:curator_recoverable, CuratorRecoverable) && Keyword.get(Application.get_env(:curator_recoverable, CuratorRecoverable), :repo)) ||
       (Application.get_env(:curator, Curator) && Keyword.get(Application.get_env(:curator, Curator), :repo))
      ), do: raise "CuratorRecoverable requires a repo"

  if !(
       (Application.get_env(:curator_recoverable, CuratorRecoverable) && Keyword.get(Application.get_env(:curator_recoverable, CuratorRecoverable), :user_schema)) ||
       (Application.get_env(:curator, Curator) && Keyword.get(Application.get_env(:curator, Curator), :user_schema))
      ), do: raise "CuratorRecoverable requires a user_schema"

  alias CuratorRecoverable.Config

  def clear_reset_password_info_changeset(changeset) do
    Ecto.Changeset.change(changeset, reset_password_token: nil, reset_password_sent_at: nil)
  end

  def set_reset_password_token!(user) do
    reset_password_token = Curator.Token.generate
    reset_password_sent_at = Timex.now

    user = user
    |> Ecto.Changeset.change(reset_password_token: reset_password_token, reset_password_sent_at: reset_password_sent_at)
    |> Config.repo.update!

    {user, reset_password_token}
  end

  def reset_password_token_expired?(%{reset_password_sent_at: reset_password_sent_at}) do
    Curator.Time.expired?(reset_password_sent_at, Config.token_expiration)
  end

  def request_reset_password_email_changeset(data, params \\ %{}) do
    import Ecto.Changeset
    types = %{email: :string}

    {data, types}
    |> cast(params, [:email])
    |> validate_required([:email])
  end
end
