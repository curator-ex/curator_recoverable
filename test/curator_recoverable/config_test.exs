defmodule CuratorRecoverable.ConfigTest do
  use ExUnit.Case, async: true
  doctest CuratorRecoverable.Config

  test "the repo" do
    assert CuratorRecoverable.Config.repo == CuratorRecoverable.Test.Repo
  end

  test "the user_schema" do
    assert CuratorRecoverable.Config.user_schema == CuratorRecoverable.Test.User
  end

  test "the token_expiration" do
    assert CuratorRecoverable.Config.token_expiration == [hours: 1]
  end
end
