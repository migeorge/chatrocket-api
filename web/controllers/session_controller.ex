defmodule Chatrocket.SessionController do
  use Chatrocket.Web, :controller

  def index(conn, _params) do
    conn
    |> json(%{status: "Ok"})
  end
end
