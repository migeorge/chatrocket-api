defmodule Chatrocket.ChangesetView do
  use Chatrocket.Web, :view

  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end

  def render("error.json", %{changeset: changeset}) do
    JaSerializer.EctoErrorSerializer.format(changeset)
  end
end
