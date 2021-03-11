defmodule RetroGameLogWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  alias RetroGameLogWeb.Schema.Types
  alias RetroGameLogWeb.Schema.Scalars

  connection(node_type: :event)
  connection(node_type: :console)

  # Type Imports
  import_types(Types.EventLogTypes)
  import_types(Types.GameLibrary.ConsoleTypes)
  import_types(Absinthe.Type.Custom)
  import_types(Absinthe.Plug.Types)

  # Custom Scalar Import
  import_types(Scalars.Json)

  query do
    import_fields(:event_log_queries)
    import_fields(:console_queries)
  end

  mutation do
    import_fields(:console_mutations)
  end
end
