defmodule RetroGameLogWeb.Plugs.Context do
  @behaviour Plug

  import Plug.Conn
  import Ecto.Query, only: [where: 2]

  alias RetroGameLog.Repo
  alias RetroGameLog.Accounts.User

  def init(opts), do: opts

  def call(conn, _) do
    case Mix.env() do
      :dev ->
        Absinthe.Plug.put_options(conn, context: %{current_user: "develop"})

      :test ->
        Absinthe.Plug.put_options(conn, context: %{current_user: "test"})

      _ ->
        context = build_context(conn)
        Absinthe.Plug.put_options(conn, context: context)
    end
  end

  @doc """
  Return the current user context based on the authorization header
  """
  def build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, current_user} <- authorize(token) do
      %{current_user: current_user}
    else
      _ -> %{}
    end
  end

  defp authorize(token) do
    User
    |> where(email: ^token)
    |> Repo.one()
    |> case do
      nil -> {:error, "invalid authorization token"}
      user -> {:ok, user}
    end
  end
end
