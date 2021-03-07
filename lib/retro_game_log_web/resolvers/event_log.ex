defmodule RetroGameLogWeb.Resolvers.EventLog do
  alias Absinthe.Relay.Connection

  alias RetroGameLog.EventLog
  alias RetroGameLogWeb.Resolvers.Helpers

  def list_events(%{filters: filters} = args, resolution) do
    case Helpers.current_user(resolution) do
      {:error, _} = error ->
        error

      current_user ->
        EventLog.list_event_log(filters)
        |> Connection.from_list(args)
    end
  end

  def get_event(%{id: event_id}, %{context: %{current_user: current_user}}),
    do: {:ok, EventLog.get_event!(event_id)}
end
