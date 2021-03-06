defmodule RetroGameLog.Repo.Migrations.CreateEventLog do
  use Ecto.Migration

  def change do
    create table(:event_log, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:user_id, :binary_id)
      add(:event_type, :string)
      add(:error, :boolean, default: false)
      add(:message, :string)
      add(:data, :map)

      timestamps()
    end
  end
end
