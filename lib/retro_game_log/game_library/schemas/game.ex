defmodule RetroGameLog.GameLibrary.Schemas.Game do
  use Ecto.Schema
  import Ecto.Changeset

  alias RetroGameLog.GameLibrary.Schemas.Console

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "games" do
    field(:country, :string)
    field(:developer, :string)
    field(:genre, :string)
    field(:name, :string)
    field(:publisher, :string)
    field(:release_date, :string)
    field(:wikipedia_url, :string)

    belongs_to(:console, Console, type: :binary_id)

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [
      :developer,
      :publisher,
      :name,
      :genre,
      :country,
      :release_date,
      :wikipedia_url,
      :console_id
    ])
    |> validate_required([
      :name,
      :console_id
    ])
  end
end
