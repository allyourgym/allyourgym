defmodule Allyourgym.Fitness.Workout do
  @moduledoc """
  This module defines the Workout schema and changeset functions.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Allyourgym.Fitness.WorkoutExercise

  schema "workouts" do
    field :name, :string
    field :description, :string
    field :is_public, :boolean, default: false
    field :notes, :string
    field :is_prebuilt, :boolean, default: false
    belongs_to :created_by, Allyourgym.Accounts.User

    # many_to_many :exercises, Allyourgym.Fitness.Exercise, join_through: Allyourgym.Fitness.WorkoutExercise

    has_many :workout_exercises, WorkoutExercise, on_replace: :delete, on_delete: :delete_all
    has_many :exercises, through: [:workout_exercises, :exercise]

    # has_many :exercises, Allyourgym.Fitness.Exercise, on_replace: :delete, on_delete: :delete_all
#
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(workout, attrs) do
    workout
    |> cast(attrs, [:name, :description, :is_public, :notes])
    |> cast_assoc(:workout_exercises, with: &WorkoutExercise.changeset/2)
    |> validate_required([:name, :description, :is_public, :notes])
  end

  def create_changeset(workout, attrs, _metadata \\ []) do
    workout
    |> cast(attrs, [:name, :description, :is_public, :notes])
    |> validate_required([:name, :description, :is_public, :notes])
  end

  def update_changeset(workout, attrs, _metadata \\ []) do
    workout
    |> cast(attrs, [:name, :description, :is_public, :notes])
    |> validate_required([:name, :description, :is_public, :notes])
  end
end
