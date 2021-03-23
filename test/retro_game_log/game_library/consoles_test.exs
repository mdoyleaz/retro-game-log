defmodule RetroGameLog.ConsolesTest do
  use RetroGameLog.DataCase

  alias RetroGameLog.GameLibrary.Consoles

  describe "consoles" do
    alias RetroGameLog.GameLibrary.Schemas.Console

    @valid_attrs %{
      graphics: "some graphics",
      manufactured_country: "some manufactured_country",
      manufacturer: "some manufacturer",
      name: "some name",
      release_date: "some release_date",
      units_sold: "some units_sold"
    }
    @update_attrs %{
      graphics: "some updated graphics",
      manufactured_country: "some updated manufactured_country",
      manufacturer: "some updated manufacturer",
      name: "some updated name",
      release_date: "some updated release_date",
      units_sold: "some updated units_sold"
    }
    @invalid_attrs %{
      graphics: nil,
      manufactured_country: nil,
      manufacturer: nil,
      name: nil,
      release_date: nil,
      units_sold: nil
    }

    def console_fixture(attrs \\ %{}) do
      {:ok, console} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Consoles.create_console()

      console
    end

    test "list_consoles/0 returns all consoles" do
      console = console_fixture()
      assert Consoles.list_consoles() == [console]
    end

    test "get_console!/1 returns the console with given id" do
      console = console_fixture()
      assert Consoles.get_console!(console.id) == console
    end

    test "create_console/1 with valid data creates a console" do
      assert {:ok, %Console{} = console} = Consoles.create_console(@valid_attrs)
      assert console.graphics == "some graphics"
      assert console.manufactured_country == "some manufactured_country"
      assert console.manufacturer == "some manufacturer"
      assert console.name == "some name"
      assert console.release_date == "some release_date"
      assert console.units_sold == "some units_sold"
    end

    test "create_console/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Consoles.create_console(@invalid_attrs)
    end

    test "update_console/2 with valid data updates the console" do
      console = console_fixture()
      assert {:ok, %Console{} = console} = Consoles.update_console(console, @update_attrs)
      assert console.graphics == "some updated graphics"
      assert console.manufactured_country == "some updated manufactured_country"
      assert console.manufacturer == "some updated manufacturer"
      assert console.name == "some updated name"
      assert console.release_date == "some updated release_date"
      assert console.units_sold == "some updated units_sold"
    end

    test "update_console/2 with invalid data returns error changeset" do
      console = console_fixture()
      assert {:error, %Ecto.Changeset{}} = Consoles.update_console(console, @invalid_attrs)
      assert console == Consoles.get_console!(console.id)
    end

    test "delete_console/1 deletes the console" do
      console = console_fixture()
      assert {:ok, %Console{}} = Consoles.delete_console(console)
      assert_raise Ecto.NoResultsError, fn -> Consoles.get_console!(console.id) end
    end

    test "change_console/1 returns a console changeset" do
      console = console_fixture()
      assert %Ecto.Changeset{} = Consoles.change_console(console)
    end
  end
end
