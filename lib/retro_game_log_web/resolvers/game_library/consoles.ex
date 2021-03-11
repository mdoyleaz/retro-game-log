defmodule RetroGameLogWeb.Resolvers.GameLibrary.Consoles do
  alias Absinthe.Relay.Connection

  alias RetroGameLog.GameLibrary.Consoles

  def list_consoles(args, _resolution) do
    Consoles.list_consoles()
    |> Connection.from_list(args)
  end

  def get_console(%{id: console_id}, _resolution), do: Consoles.get_console!(console_id)

  def create_console(%{console_input: args}, _resolution) do
    {:ok, console} = Consoles.create_console(args)
    {:ok, console}
  end

  def update_console(%{id: id, console_details: args}, _resolution),
    do: Consoles.update_console(id, args)
end
