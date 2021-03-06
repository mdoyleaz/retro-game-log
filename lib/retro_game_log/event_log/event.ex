defmodule RetroGameLog.EventLog.Event do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "event_log" do
    field(:user_id, :binary_id)

    field(:event_type, Ecto.Enum,
      values: [:create_record, :delete_record, :update_record, :get_record]
    )

    field(:message, :string)
    field(:error, :boolean)
    field(:data, :map)

    timestamps()
  end

  @doc false
  def changeset(events, attrs) do
    events
    |> cast(attrs, [:user_id, :event_type, :error, :message, :data])
    |> validate_required([:event_type, :message, :data])
  end
end
