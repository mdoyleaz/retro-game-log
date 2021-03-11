defmodule RetroGameLogWeb.Schema.Types.GameLibrary.ConsoleTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  import RetroGameLogWeb.Resolvers.GameLibrary.Consoles

  object :event do
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
end
