defmodule Allyourgym.Repo.Migrations.CreateWorkouts do
  use Ecto.Migration

  def change do
    create table(:workouts) do
      add :name, :string
      add :description, :text
      add :is_public, :boolean, default: false, null: false
      add :notes, :text
      add :created_by_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:workouts, [:created_by_id])
  end
end
