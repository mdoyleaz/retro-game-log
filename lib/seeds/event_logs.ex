defmodule Seeds.EventLogs do
  alias RetroGameLog.Log
  alias Faker
  @error [true, false]
  @event_types ["create_record", "delete_record", "update_record", "get_record"]
  def create_faker_data() do
    Enum.map(1..25, fn _ ->
      %{
        user_id: Faker.UUID.v4(),
        event_type: Enum.random(@event_types),
        message: Faker.Lorem.Shakespeare.as_you_like_it(),
        error: Enum.random(@error),
        payload: "{\"payload\": \"payload\"}"
      }
    end)
  end

  def add_event_logs(), do: Enum.each(create_faker_data(), &Log.create_event/1)
end
