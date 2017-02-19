use Mix.Config

config :guardian, Guardian,
  issuer: "MyApp",
  ttl: { 1, :days },
  verify_issuer: true,
  secret_key: "woiuerojksldkjoierwoiejrlskjdf",
  serializer: CuratorRecoverable.TestGuardianSerializer

# config :curator_recoverable, CuratorRecoverable,
#        repo: CuratorRecoverable.Test.Repo,
#        user_schema: CuratorRecoverable.Test.User

# config :curator_recoverable, ecto_repos: [CuratorRecoverable.Test.Repo]

# config :curator_recoverable, CuratorRecoverable.Test.Repo,
#   adapter: Ecto.Adapters.Postgres,
#   username: "postgres",
#   password: "",
#   database: "curator_recoverable_docs",
#   hostname: "localhost",
#   pool: Ecto.Adapters.SQL.Sandbox,
#   priv: "test/support"
