use Mix.Config

config :logger, level: :warn

config :guardian, Guardian,
  issuer: "MyApp",
  ttl: { 1, :days },
  verify_issuer: true,
  secret_key: "woiuerojksldkjoierwoiejrlskjdf",
  serializer: CuratorRecoverable.Test.GuardianSerializer

config :curator_recoverable, CuratorRecoverable,
  repo: CuratorRecoverable.Test.Repo,
  user_schema: CuratorRecoverable.Test.User

config :curator_recoverable, ecto_repos: [CuratorRecoverable.Test.Repo]

config :curator_recoverable, CuratorRecoverable.Test.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox,
  url: "ecto://localhost/curator_recoverable_test",
  size: 1,
  max_overflow: 0,
  priv: "test/support"
