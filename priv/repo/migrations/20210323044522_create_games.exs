defmodule RetroGameLog.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:developer, :string)
      add(:publisher, :string)
      add(:name, :string)
      add(:genre, :string)
      add(:country, :string)
      add(:release_date, :string)
      add(:wikipedia_url, :string)
      add(:console_id, references(:consoles, on_delete: :nothing, type: :binary_id))

      timestamps()
    end

    create(index(:games, [:console_id]))
  end
end
