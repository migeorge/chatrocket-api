defmodule Chatrocket.Router do
  use Chatrocket.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  pipeline :api_auth do
    plug :accepts, ["json", "json-api"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/api", Chatrocket do
    pipe_through :api

    post "/register", RegistrationController, :create
    post "/token", SessionController, :create, as: :login
  end

  scope "/api", Chatrocket do
    pipe_through :api_auth

    get "/user/current", UserController, :current
  end
end
