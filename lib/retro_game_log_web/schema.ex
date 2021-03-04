defmodule RetroGameLogWeb.Schema do
  use Absinthe.Schema

  alias RetroGameLogWeb.Schema.Types

  import_types(Types.EventLogTypes)
  import_types(Absinthe.Type.Custom)

  query do
    import_fields(:event_log_queries)
  end
end
