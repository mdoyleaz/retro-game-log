defmodule RetroGameLogWeb.Schema.Types.GameLibrary.ConsoleTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  import RetroGameLogWeb.Resolvers.GameLibrary.Consoles

  object :console do
    field(:id, :id)
    field(:name, :string)
    field(:manufacturer, :string)
    field(:manufactured_country, :string)
    field(:release_date, :string)
    field(:units_solds, :string)
    field(:graphics, :string)
    field(:wikipedia_url, :string)
    field(:inserted_at, :naive_datetime, name: "created")
    field(:updated_at, :naive_datetime, name: "updated")
  end

  object :console_queries do
    @desc "Get all consoles"

    connection field(:all_consoles, node_type: :console) do
      resolve(&list_consoles/2)
    end

    @desc "Get a single console"
    field(:get_console, :console) do
      arg(:id, non_null(:id))
      resolve(&get_console/2)
    end
  end
end
