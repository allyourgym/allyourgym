defmodule Allyourgym.Repo.Migrations.CreateWorkoutsExercises do
  use Ecto.Migration

  def change do
    create table(:workouts_exercises) do
      add :workout_id, references(:workouts, on_delete: :delete_all)
      add :exercise_id, references(:exercises, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:workouts_exercises, [:workout_id])
    create index(:workouts_exercises, [:exercise_id])
    create unique_index(:workouts_exercises, [:workout_id, :exercise_id])
  end
end
