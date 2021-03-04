defmodule RetroGameLogWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  alias RetroGameLogWeb.Schema.Types

  import_types(Types.EventLogTypes)
  import_types(Absinthe.Type.Custom)
  import_types(Absinthe.Plug.Types)
  import_types(Absinthe.Type.Custom)

  query do
    import_fields(:event_log_queries)
  end
end
