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

  input_object :console_input do
    field(:name, non_null(:string))
    field(:manufacturer, non_null(:string))
    field(:manufactured_country, :string)
    field(:release_date, :string)
    field(:units_solds, :string)
    field(:graphics, :string)
    field(:wikipedia_url, :string)
    field(:inserted_at, :naive_datetime, name: "created")
    field(:updated_at, :naive_datetime, name: "updated")
  end

  input_object :console_details do
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

  object :console_mutations do
    @desc "Create a console"
    field(:create_console, :console) do
      arg(:console_input, :console_input)

      resolve(&create_console/2)
    end

    @desc "Update a console"
    field :update_console, :console do
      arg(:id, non_null(:id))
      arg(:console_details, :console_details)

      resolve(&update_console/2)
    end
  end
end
