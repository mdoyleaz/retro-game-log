defmodule RetroGameLog.Log.Event do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "event_log" do
    field(:user_id, :binary_id)
    field(:event_type, :string)
    field(:message, :string)
    field(:error, :boolean)
    field(:payload, :string)

    timestamps()
  end

  @doc false
  def changeset(events, attrs) do
    events
    |> cast(attrs, [:user_id, :event_type, :error, :message, :payload])
    |> validate_required([:user_id, :event_type, :message, :payload])
  end
end
