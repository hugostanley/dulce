defmodule Dulce.Workspaces.Workspace do
  alias Dulce.UsersWorkspaces.UserWorkspace
  alias Dulce.Accounts.User
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "workspaces" do
    field :name, :string
    belongs_to :owner, User, foreign_key: :owner_id

    many_to_many :users, User, join_through: UserWorkspace

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(workspace, attrs) do
    workspace
    |> cast(attrs, [:name, :owner_id])
    |> validate_required([:name, :owner_id])
  end
end
