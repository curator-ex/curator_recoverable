defmodule UsersMigration do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string

      # Recoverable
      add :reset_password_token, :string
      add :reset_password_sent_at, :utc_datetime

      timestamps()
    end
    create unique_index(:users, [:email])
    create unique_index(:users, [:reset_password_token])
  end
end
