defmodule RetroGameLogWeb.Schema.Resolvers.EventLog do
  alias RetroGameLog.Log

  def list_events(_parent, _args, _resolution) do
    {:ok, Log.list_event_log()}
  end

  def get_event(parent, %{id: product_id}, _resolution) do
    IO.inspect(parent)
    {:ok, Log.get_event!(product_id)}
  end
end
