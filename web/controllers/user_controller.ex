defmodule Chatrocket.UserController do
  use Chatrocket.Web, :controller

  alias Chatrocket.User
  plug Guardian.Plug.EnsureAuthenticated, handler: Chatrocket.AuthErrorHandler

  def current(conn, _) do
    user = conn
    |> Guardian.Plug.current_resource

    conn
    |> render(Chatrocket.UserView, "show.json", user: user)
  end
end
