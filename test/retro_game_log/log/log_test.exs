defmodule RetroGameLog.LogTest do
  use RetroGameLog.DataCase

  alias RetroGameLog.EventLog
  alias RetroGameLog.EventLog.Event

  describe "event_log" do
    @valid_attrs %{
      event_type: :create_record,
      error: false,
      message: "some message",
      data: %{"data" => "data"}
    }
    @update_attrs %{
      event_type: :update_record,
      message: "some updated message",
      data: %{"data" => "data"}
    }
    @invalid_attrs %{event_type: nil, message: nil, data: nil}
    @filters %{
      event_type: [:create_record]
    }

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> EventLog.create_event()

      event
    end

    test "list_event_log/0 returns all event_log" do
      events = event_fixture()
      EventLog.list_event_log()

      assert EventLog.list_event_log() == [events]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert EventLog.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a events" do
      assert {:ok, %Event{} = event} = EventLog.create_event(@valid_attrs)
      assert event.event_type == :create_record
      assert event.message == "some message"
      assert event.data == %{"data" => "data"}
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = EventLog.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the events" do
      event = event_fixture()
      assert {:ok, event} = EventLog.update_event(event, @update_attrs)
      assert %Event{} = event
      assert event.event_type == :update_record
      assert event.message == "some updated message"
      assert event.data == %{"data" => "data"}
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = EventLog.update_event(event, @invalid_attrs)
      assert event == EventLog.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = EventLog.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> EventLog.get_event!(event.id) end
    end

    test "change_event/1 returns a events changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = EventLog.change_event(event)
    end

    test "list_event_log with filters" do
      EventLog.create_event(@valid_attrs)

      @valid_attrs
      |> Map.put(:event_type, :update_record)
      |> EventLog.create_event()

      [event | _] = EventLog.list_event_log(@filters)
      assert event.event_type == :create_record
    end
  end
end
