defmodule Dulce.UsersWorkspaces do
  @moduledoc """
  The UsersWorkspaces context.
  """

  import Ecto.Query, warn: false
  alias Dulce.Repo

  alias Dulce.UsersWorkspaces.UserWorkspace

  @doc """
  Returns the list of user_workspaces.

  ## Examples

      iex> list_user_workspaces()
      [%UserWorkspace{}, ...]

  """
  def list_user_workspaces do
    Repo.all(UserWorkspace)
  end

  @doc """
  Gets a single user_workspace.

  Raises `Ecto.NoResultsError` if the User workspace does not exist.

  ## Examples

      iex> get_user_workspace!(123)
      %UserWorkspace{}

      iex> get_user_workspace!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_workspace!(id), do: Repo.get!(UserWorkspace, id)

  @doc """
  Creates a user_workspace.

  ## Examples

      iex> create_user_workspace(%{field: value})
      {:ok, %UserWorkspace{}}

      iex> create_user_workspace(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_workspace(attrs \\ %{}) do
    %UserWorkspace{}
    |> UserWorkspace.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_workspace.

  ## Examples

      iex> update_user_workspace(user_workspace, %{field: new_value})
      {:ok, %UserWorkspace{}}

      iex> update_user_workspace(user_workspace, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_workspace(%UserWorkspace{} = user_workspace, attrs) do
    user_workspace
    |> UserWorkspace.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_workspace.

  ## Examples

      iex> delete_user_workspace(user_workspace)
      {:ok, %UserWorkspace{}}

      iex> delete_user_workspace(user_workspace)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_workspace(%UserWorkspace{} = user_workspace) do
    Repo.delete(user_workspace)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_workspace changes.

  ## Examples

      iex> change_user_workspace(user_workspace)
      %Ecto.Changeset{data: %UserWorkspace{}}

  """
  def change_user_workspace(%UserWorkspace{} = user_workspace, attrs \\ %{}) do
    UserWorkspace.changeset(user_workspace, attrs)
  end
end
