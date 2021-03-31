defmodule RetroGameLog.GameLibrary.Schemas.Console do
  use Ecto.Schema
  import Ecto.Changeset

  alias RetroGameLog.GameLibrary.Schemas.Game

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "consoles" do
    field(:graphics, :string)
    field(:manufactured_country, :string)
    field(:manufacturer, :string)
    field(:name, :string)
    field(:release_date, :date)
    field(:units_sold, :string)
    field(:wikipedia_url, :string)

    timestamps()
  end

  @doc false
  def changeset(console, attrs) do
    console
    |> cast(attrs, [
      :manufacturer,
      :name,
      :manufactured_country,
      :release_date,
      :graphics,
      :units_sold,
      :wikipedia_url
    ])
    |> validate_required([:manufacturer, :name])
  end
end
