defmodule CuratorRecoverable.Test.Repo do
  use Ecto.Repo, otp_app: :curator_recoverable

  def log(_cmd), do: nil
end
