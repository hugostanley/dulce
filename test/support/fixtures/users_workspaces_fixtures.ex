defmodule Dulce.UsersWorkspacesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Dulce.UsersWorkspaces` context.
  """

  @doc """
  Generate a user_workspace.
  """
  def user_workspace_fixture(attrs \\ %{}) do
    {:ok, user_workspace} =
      attrs
      |> Enum.into(%{

      })
      |> Dulce.UsersWorkspaces.create_user_workspace()

    user_workspace
  end
end
