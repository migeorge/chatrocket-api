defmodule Chatrocket.UserTest do
  use Chatrocket.ModelCase

  alias Chatrocket.User

  @valid_attrs %{email: "mike@test.com",
                 password: "1234567890asdfghjkl",
                 password_confirmation: "1234567890asdfghjkl"}

  @invalid_attrs %{email: "this is not an email",
                   password: "a",
                   password_confirmation: "b"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "mismatched password confirmation" do
    changeset = User.changeset(%User{}, %{ email: "mike@test.com",
      password: "flipflop",
      password_confirmation: "flopflip"})
    refute changeset.valid?
  end

  test "missing password confirmation" do
    changeset = User.changeset(%User{}, %{ email: "mike@test.com",
      password: "flipflop"})
    refute changeset.valid?
  end

  test "password too short" do
    changeset = User.changeset(%User{}, %{ email: "mike@test.com",
      password: "cat",
      password_confirmation: "cat"})
    refute changeset.valid?
  end
end
