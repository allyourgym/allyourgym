defmodule Allyourgym.Fitness.Workout do
  @moduledoc """
  This module defines the Workout schema and changeset functions.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "workouts" do
    field :name, :string
    field :description, :string
    field :is_public, :boolean, default: false
    field :notes, :string
    field :is_prebuilt, :boolean, default: false
    belongs_to :created_by, Allyourgym.Accounts.User

    # many_to_many :exercises, Allyourgym.Fitness.Exercise, join_through: "workouts_exercises"
    many_to_many :exercises, Allyourgym.Fitness.Exercise, join_through: Allyourgym.Fitness.WorkoutExercise

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(workout, attrs) do
    workout
    |> cast(attrs, [:name, :description, :is_public, :notes])
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
