defmodule Chatrocket.Router do
  use Chatrocket.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Chatrocket do
    pipe_through :api

    resources "session", SessionController, only: [:index]
  end
end
