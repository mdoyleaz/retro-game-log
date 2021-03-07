defmodule RetroGameLogWeb.Router do
  use RetroGameLogWeb, :router

  pipeline :api do
    plug(Plug.Logger, log: :debug)
    plug(:accepts, ["json"])
    plug(:fetch_session)
    plug(:put_secure_browser_headers)
    plug(RetroGameLogWeb.Plugs.Context)
  end

  scope "/api" do
    pipe_through(:api)
    forward("/", Absinthe.Plug, schema: RetroGameLogWeb.Schema)
  end

  scope "/graphiql" do
    pipe_through(:api)

    forward("/", Absinthe.Plug.GraphiQL, schema: RetroGameLogWeb.Schema)
  end
end
