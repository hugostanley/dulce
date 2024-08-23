defmodule Dulce.Repo.Migrations.AddColumnsToUsers do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :name, :string, null: true
      add :avatar_url, :string, null: true
    end

  end
end
