defmodule CuratorRecoverableTest do
  use ExUnit.Case
  doctest CuratorRecoverable

  use CuratorRecoverable.TestCase

  setup do
    changeset = User.changeset(%User{}, %{
      name: "Test User",
      email: "test_user@test.com",
    })

    user = Repo.insert!(changeset)

    { :ok, %{
        user: user,
      }
    }
  end

  test "set_reset_password_token!", %{user: user} do
    {user, token} = CuratorRecoverable.set_reset_password_token!(user)

    assert user.reset_password_token == token
    assert user.reset_password_sent_at
  end
end
