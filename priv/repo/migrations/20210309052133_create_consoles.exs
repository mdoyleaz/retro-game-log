defmodule RetroGameLog.Repo.Migrations.CreateConsoles do
  use Ecto.Migration

  def change do
    create table(:consoles, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:manufacturer, :string)
      add(:name, :string)
      add(:manufactured_country, :string)
      add(:release_date, :date)
      add(:graphics, :string)
      add(:units_sold, :string)
      add(:wikipedia_url, :string)

      timestamps()
    end
  end
end
