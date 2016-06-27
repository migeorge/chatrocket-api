defmodule Chatrocket.UserView do
  use Chatrocket.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Chatrocket.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Chatrocket.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      "type": "user",
      "id": user.id,
      "attributes": %{
        "email": user.email
      }
    }
  end
end
