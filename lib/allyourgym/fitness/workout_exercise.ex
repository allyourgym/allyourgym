defmodule Allyourgym.Fitness.WorkoutExercise do
  @moduledoc """
  Schema for the WorkoutExercise entity, representing the relationship between workouts and exercises.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "workouts_exercises" do
    field :position, :integer
    belongs_to :workout, Allyourgym.Fitness.Workout
    belongs_to :exercise, Allyourgym.Fitness.Exercise

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(workout_exercise, attrs) do
    workout_exercise
    |> cast(attrs, [:workout_id, :exercise_id, :position])
    |> validate_required([:workout_id, :exercise_id])
    |> unique_constraint([:workout_id, :exercise_id])
  end
end
