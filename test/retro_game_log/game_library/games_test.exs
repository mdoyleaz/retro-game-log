defmodule RetroGameLog.GameLibrary.GamesTest do
  use RetroGameLog.DataCase

  alias RetroGameLog.GameLibrary.Games
  alias RetroGameLog.GameLibrary.Consoles

  describe "games" do
    alias RetroGameLog.GameLibrary.Schemas.Game

    @valid_attrs %{
      country: "some country",
      developer: "some developer",
      genre: "some genre",
      name: "some name",
      publisher: "some publisher",
      release_date: Date.from_iso8601!("2020-03-01"),
      wikipedia_url: "some wikipedia_url",
      console: %{}
    }
    @update_attrs %{
      country: "some updated country",
      developer: "some updated developer",
      genre: "some updated genre",
      name: "some updated name",
      publisher: "some updated publisher",
      release_date: Date.from_iso8601!("2020-03-02"),
      wikipedia_url: "some updated wikipedia_url"
    }
    @invalid_attrs %{
      country: nil,
      developer: nil,
      genre: nil,
      name: nil,
      publisher: nil,
      release_date: nil,
      wikipedia_url: nil
    }

    @valid_console_attrs %{
      manufacturer: "Sega",
      name: "Genesis"
    }

    def game_fixture(attrs \\ %{}) do
      {:ok, %{id: console_id}} = Consoles.create_console(@valid_console_attrs)

      game_attrs = Map.put(@valid_attrs, :console_id, console_id)

      {:ok, game} =
        attrs
        |> Enum.into(game_attrs)
        |> Games.create_game()

      game
    end

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Games.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Games.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      {:ok, %{id: console_id}} = Consoles.create_console(@valid_console_attrs)
      game_attrs = Map.put(@valid_attrs, :console_id, console_id)

      assert {:ok, %Game{} = game} = Games.create_game(game_attrs)
      assert game.country == "some country"
      assert game.developer == "some developer"
      assert game.genre == "some genre"
      assert game.name == "some name"
      assert game.publisher == "some publisher"
      assert game.release_date == Date.from_iso8601!("2020-03-01")
      assert game.wikipedia_url == "some wikipedia_url"
      assert game.console_id == console_id
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      assert {:ok, %Game{} = game} = Games.update_game(game, @update_attrs)
      assert game.country == "some updated country"
      assert game.developer == "some updated developer"
      assert game.genre == "some updated genre"
      assert game.name == "some updated name"
      assert game.publisher == "some updated publisher"
      assert game.release_date == Date.from_iso8601!("2020-03-02")
      assert game.wikipedia_url == "some updated wikipedia_url"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_game(game, @invalid_attrs)
      assert game == Games.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Games.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Games.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Games.change_game(game)
    end
  end
end
