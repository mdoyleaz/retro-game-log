defmodule RetroGameLog.LogTest do
  use RetroGameLog.DataCase

  alias RetroGameLog.EventLog

  describe "event_log" do
    alias RetroGameLog.EventLog.Event

    @valid_attrs %{
      event_type: "some event_type",
      error: false,
      message: "some message",
      payload: "some payload"
    }
    @update_attrs %{
      event_type: "some updated event_type",
      message: "some updated message",
      payload: "some updated payload"
    }
    @invalid_attrs %{event_type: nil, message: nil, payload: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> EventLog.create_event()

      event
    end

    test "list_event_log/0 returns all event_log" do
      events = event_fixture()
      assert EventLog.list_event_log() == [events]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert EventLog.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a events" do
      assert {:ok, %Event{} = event} = EventLog.create_event(@valid_attrs)
      assert event.event_type == "some event_type"
      assert event.message == "some message"
      assert event.payload == "some payload"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = EventLog.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the events" do
      event = event_fixture()
      assert {:ok, event} = EventLog.update_event(event, @update_attrs)
      assert %Event{} = event
      assert event.event_type == "some updated event_type"
      assert event.message == "some updated message"
      assert event.payload == "some updated payload"
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
  end
end
