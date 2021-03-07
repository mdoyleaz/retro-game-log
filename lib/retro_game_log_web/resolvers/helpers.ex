defmodule RetroGameLogWeb.Resolvers.Helpers do
  def current_user(%{context: %{current_user: current_user}}),
    do: current_user

  def current_user(_), do: {:error, "Not Authorized"}
end
