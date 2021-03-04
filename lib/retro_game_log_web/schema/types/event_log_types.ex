defmodule RetroGameLogWeb.Schema.Types.EventLogTypes do
  use Absinthe.Schema.Notation
  alias RetroGameLogWeb.Schema.Resolvers.EventLog

  object :event do
    field(:id, :id)
    field(:user_id, :id)
    field(:event_type, :string)
    field(:message, :string)
    field(:error, :boolean)
    field(:payload, :string)
    field(:inserted_at, :naive_datetime)
    field(:updated_at, :naive_datetime)
  end

  object :event_log_queries do
    @desc "Get all event logs"
    field :event_logs, list_of(:event) do
      resolve(&EventLog.list_events/3)
    end

    field :event, :event do
      arg(:id, non_null(:id))
      resolve(&EventLog.get_event/3)
    end
  end
end
