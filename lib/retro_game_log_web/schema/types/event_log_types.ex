defmodule RetroGameLogWeb.Schema.Types.EventLogTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  import RetroGameLogWeb.Schema.Resolvers.EventLog

  object :event do
    field(:id, :id)
    field(:user_id, :id)
    field(:event_type, :string)
    field(:message, :string)
    field(:error, :boolean)
    field(:payload, :string)
    field(:inserted_at, :naive_datetime, name: "created")
    field(:updated_at, :naive_datetime, name: "updated")
  end

  connection(node_type: :event)

  object :event_log_queries do
    @desc "Get all event logs with paginated results"
    connection field(:all_event_logs, node_type: :event) do
      resolve(&list_events/2)
    end

    @desc "Get a single event log by id"
    field :event_log, :event do
      arg(:id, non_null(:id))
      resolve(&get_event/2)
    end
  end
end
