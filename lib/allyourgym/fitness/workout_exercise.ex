defmodule Allyourgym.Fitness.WorkoutExercise do
  @moduledoc """
  Schema for the WorkoutExercise entity, representing the relationship between workouts and exercises.
  """
  use Ecto.Schema
  import Ecto.Changeset


  schema "workouts_exercises" do
    belongs_to :workout, Allyourgym.Fitness.Workout
    belongs_to :exercise, Allyourgym.Fitness.Exercise
    field :position, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(workout_exercise, attrs) do
    workout_exercise
    # |> cast(attrs, [:exercise_id, :position])
    |> cast(attrs, [:workout_id, :exercise_id, :position])
    |> validate_required([:workout_id, :exercise_id])
    |> unique_constraint([:workout_id, :exercise_id])
    |> foreign_key_constraint(:workout_id)
    |> foreign_key_constraint(:exercise_id)
  end
end
