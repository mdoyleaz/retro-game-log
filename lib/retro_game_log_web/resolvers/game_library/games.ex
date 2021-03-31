defmodule RetroGameLogWeb.Resolvers.GameLibrary.Games do
  alias Absinthe.Relay.Connection

  alias RetroGameLog.GameLibrary.Games

  def list_games(args, _resolution) do
    filters = Map.get(args, :filters)

    Games.list_games(filters)
    |> Connection.from_list(args)
  end

  def delete_game(%{id: id}, __resolution), do: Games.delete_game(id)
end
