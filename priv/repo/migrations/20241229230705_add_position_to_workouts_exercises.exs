defmodule Allyourgym.Repo.Migrations.AddPositionToWorkoutsExercises do
  use Ecto.Migration

  def change do
    alter table(:workouts_exercises) do
      add :position, :integer
    end
  end
end
