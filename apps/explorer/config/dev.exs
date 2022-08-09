import Config

database_api_url =
  if System.get_env("DATABASE_READ_ONLY_API_URL"),
    do: System.get_env("DATABASE_READ_ONLY_API_URL"),
    else: System.get_env("DATABASE_URL")

pool_size =
  if System.get_env("DATABASE_READ_ONLY_API_URL"),
    do: String.to_integer(System.get_env("POOL_SIZE", "40")),
    else: String.to_integer(System.get_env("POOL_SIZE", "50"))

# Configure your database
config :explorer, Explorer.Repo, timeout: :timer.seconds(80)

# Configure API database
config :explorer, Explorer.Repo.Replica1, timeout: :timer.seconds(80)

config :explorer, Explorer.Tracer, env: "dev", disabled?: true

config :logger, :explorer,
  level: :debug,
  path: Path.absname("logs/dev/explorer.log")

config :logger, :reading_token_functions,
  level: :debug,
  path: Path.absname("logs/dev/explorer/tokens/reading_functions.log"),
  metadata_filter: [fetcher: :token_functions]

config :logger, :token_instances,
  level: :debug,
  path: Path.absname("logs/dev/explorer/tokens/token_instances.log"),
  metadata_filter: [fetcher: :token_instances]
