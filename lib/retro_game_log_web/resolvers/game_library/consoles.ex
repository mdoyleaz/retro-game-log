defmodule RetroGameLogWeb.Resolvers.GameLibrary.Consoles do
  alias Absinthe.Relay.Connection

  alias RetroGameLog.GameLibrary.Consoles

  def list_consoles(args, _resolution) do
    Consoles.list_consoles()
    |> Connection.from_list(args)
  end

  def get_console(%{id: console_id}, _resolution), do: Consoles.get_console!(console_id)
end
