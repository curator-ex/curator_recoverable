defmodule CuratorRecoverable.Schema do
  @moduledoc """
  """

  defmacro __using__(_opts \\ []) do
    quote do
      import unquote(__MODULE__)
    end
  end

  defmacro curator_recoverable_schema do
    quote do
      field :reset_password_token, :string
      field :reset_password_sent_at, Timex.Ecto.DateTime
    end
  end
end
