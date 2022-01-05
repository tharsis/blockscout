use Mix.Config

# DO NOT make it `:debug` or all Ecto logs will be shown for indexer
config :logger, :console, level: :info

config :logger, :ecto,
  level: :debug,
  path: Path.absname("logs/dev/ecto.log"),
  rotate: %{max_bytes: 52_428_800, keep: 19}

config :logger, :error,
  path: Path.absname("logs/dev/error.log"),
  rotate: %{max_bytes: 52_428_800, keep: 19}
