defmodule Dulce.Repo.Migrations.CreateUserWorkspaces do
  use Ecto.Migration

  def change do
    create table(:user_workspaces, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :workspace_id, references(:workspaces, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:user_workspaces, [:user_id])
    create index(:user_workspaces, [:workspace_id])
  end
end
