defmodule RetroGameLogWeb.Schema.Types.GameLibrary.GameTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  import RetroGameLogWeb.Resolvers.GameLibrary.Games

  object :game do
    field(:name, :string)
    field(:developer, :string)
    field(:publisher, :string)
    field(:country, :string)
    field(:genre, :string)
    field(:release_date, :date)
    field(:wikipedia_url, :string)
  end

  input_object :game_filters do
    field(:console, :id)
    field(:publisher, :string)
    field(:genre, :string)
  end

  object :game_queries do
    @desc "Get all games"

    connection field(:all_games, node_type: :game) do
      arg(:filters, :game_filters, default_value: %{})
      resolve(&list_games/2)
    end

    @desc "Delete a game"
    field :delete_game, :game do
      arg(:id, non_null(:id))
      resolve(&delete_game/2)
    end
  end
end
