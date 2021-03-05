defmodule RetroGameLog.EventLog do
  @moduledoc """
  The Log context.
  """

  import Ecto.Query
  alias RetroGameLog.Repo

  alias RetroGameLog.EventLog.Event

  @doc """
  Returns the list of event_log.

  ## Examples

      iex> list_event_log(%{})
      [%Event{}, ...]

  """
  def list_event_log(filters \\ %{}) do
    Event
    |> where(^event_log_filters(filters))
    |> Repo.all()
  end

  defp event_log_filters(filters) do
    Enum.reduce(filters, dynamic(true), fn
      {:event_type, value}, dynamic ->
        dynamic([el], ^dynamic and el.event_type in ^value)

      {:error, value}, dynamic ->
        dynamic([el], ^dynamic and el.error == ^value)

      {:user_id, value}, dynamic ->
        dynamic([el], ^dynamic and el.user_id == ^value)

      {:date_range, value}, dynamic ->
        filter_date_range(value, dynamic)

      {_, _}, dynamic ->
        dynamic
    end)
  end

  defp filter_date_range(%{start: start_date, end: end_date}, dynamic) do
    dynamic([el], ^dynamic and el.inserted_at >= ^start_date and el.inserted_at <= ^end_date)
  end

  defp filter_date_range(%{start: start_date}, dynamic) do
    dynamic([el], ^dynamic and el.inserted_at >= ^start_date)
  end

  defp filter_date_range(%{end: end_date}, dynamic) do
    dynamic([el], ^dynamic and el.inserted_at <= ^end_date)
  end

  @doc """
  Gets a single event.

  Raises `Ecto.NoResultsError` if the Event does not exist.

  ## Examples

      iex> get_event!(123)
      %Event{}

      iex> get_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event!(id), do: Repo.get!(Event, id)

  @doc """
  Creates a event.

  ## Examples

      iex> create_event(%{field: value})
      {:ok, %Event{}}

      iex> create_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event(attrs \\ %{}) do
    %Event{}
    |> Event.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event.

  ## Examples

      iex> update_event(event, %{field: new_value})
      {:ok, %Event{}}

      iex> update_event(event, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event(%Event{} = event, attrs) do
    event
    |> Event.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Event.

  ## Examples

      iex> delete_event(event)
      {:ok, %Event{}}

      iex> delete_event(event)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event(%Event{} = event) do
    Repo.delete(event)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event changes.

  ## Examples

      iex> change_event(event)
      %Ecto.Changeset{source: %Event{}}

  """
  def change_event(%Event{} = event) do
    Event.changeset(event, %{})
  end
end
