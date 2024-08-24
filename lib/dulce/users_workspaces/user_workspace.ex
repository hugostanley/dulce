defmodule Dulce.UsersWorkspaces.UserWorkspace do
  alias Dulce.Workspaces.Workspace
  alias Dulce.Accounts.User
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "user_workspaces" do
    belongs_to :user, User
    belongs_to :workspace, Workspace

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_workspace, attrs) do
    user_workspace
    |> cast(attrs, [:user_id, :workspace_id])
    |> validate_required([:user_id, :workspace_id])
  end
end
