defmodule Dulce.WorkspacesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Dulce.Workspaces` context.
  """

  @doc """
  Generate a workspace.
  """
  def workspace_fixture(attrs \\ %{}) do
    {:ok, workspace} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Dulce.Workspaces.create_workspace()

    workspace
  end
end
