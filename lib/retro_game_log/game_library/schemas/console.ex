defmodule RetroGameLog.GameLibrary.Platform do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "platforms" do
    field(:graphics, :string)
    field(:manufactured_country, :string)
    field(:manufacturer, :string)
    field(:name, :string)
    field(:release_date, :string)
    field(:units_sold, :string)
    field(:wikipedia_url, :string)

    timestamps()
  end

  @doc false
  def changeset(platform, attrs) do
    platform
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
