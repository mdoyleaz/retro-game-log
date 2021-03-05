defmodule RetroGameLogWeb.Schema.Resolvers.EventLog do
  alias RetroGameLog.EventLog
  alias Absinthe.Relay.Connection

  def list_events(args, _resolution) do
    EventLog.list_event_log()
    |> Connection.from_list(args)
  end

  def get_event(%{id: event_id}, _resolution), do: {:ok, EventLog.get_event!(event_id)}
end
