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

  input_object :event_log_filters do
    field(:date_range, :date_range_filter)
    field(:event_type, list_of(:event_types))
    field(:error, :boolean)
    field(:user_id, :id)
  end

  input_object :date_range_filter do
    field(:start, :naive_datetime)
    field(:end, :naive_datetime)
  end

  enum(:event_types, values: [:create_record, :delete_record, :update_record, :get_record])

  object :event_log_queries do
    @desc "Get all event logs with paginated results"

    connection field(:all_event_logs, node_type: :event) do
      arg(:filters, :event_log_filters, default_value: %{})

      resolve(&list_events/2)
    end

    @desc "Get a single event log by id"
    field :event_log, :event do
      arg(:id, non_null(:id))
      resolve(&get_event/2)
    end
  end
end
