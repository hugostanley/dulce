defmodule Dulce.UsersWorkspacesTest do
  use Dulce.DataCase

  alias Dulce.UsersWorkspaces

  describe "user_workspaces" do
    alias Dulce.UsersWorkspaces.UserWorkspace

    import Dulce.UsersWorkspacesFixtures

    @invalid_attrs %{}

    test "list_user_workspaces/0 returns all user_workspaces" do
      user_workspace = user_workspace_fixture()
      assert UsersWorkspaces.list_user_workspaces() == [user_workspace]
    end

    test "get_user_workspace!/1 returns the user_workspace with given id" do
      user_workspace = user_workspace_fixture()
      assert UsersWorkspaces.get_user_workspace!(user_workspace.id) == user_workspace
    end

    test "create_user_workspace/1 with valid data creates a user_workspace" do
      valid_attrs = %{}

      assert {:ok, %UserWorkspace{} = user_workspace} = UsersWorkspaces.create_user_workspace(valid_attrs)
    end

    test "create_user_workspace/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UsersWorkspaces.create_user_workspace(@invalid_attrs)
    end

    test "update_user_workspace/2 with valid data updates the user_workspace" do
      user_workspace = user_workspace_fixture()
      update_attrs = %{}

      assert {:ok, %UserWorkspace{} = user_workspace} = UsersWorkspaces.update_user_workspace(user_workspace, update_attrs)
    end

    test "update_user_workspace/2 with invalid data returns error changeset" do
      user_workspace = user_workspace_fixture()
      assert {:error, %Ecto.Changeset{}} = UsersWorkspaces.update_user_workspace(user_workspace, @invalid_attrs)
      assert user_workspace == UsersWorkspaces.get_user_workspace!(user_workspace.id)
    end

    test "delete_user_workspace/1 deletes the user_workspace" do
      user_workspace = user_workspace_fixture()
      assert {:ok, %UserWorkspace{}} = UsersWorkspaces.delete_user_workspace(user_workspace)
      assert_raise Ecto.NoResultsError, fn -> UsersWorkspaces.get_user_workspace!(user_workspace.id) end
    end

    test "change_user_workspace/1 returns a user_workspace changeset" do
      user_workspace = user_workspace_fixture()
      assert %Ecto.Changeset{} = UsersWorkspaces.change_user_workspace(user_workspace)
    end
  end
end
