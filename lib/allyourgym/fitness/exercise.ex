defmodule Allyourgym.Fitness.Exercise do
  @moduledoc """
  This module defines the Exercise schema and changeset functions.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "exercises" do
    field :name, :string
    field :notes, :string
    field :youtube_link, :string
    field :illustration_card_number, :integer
    field :muscle_group, :string
    field :eee, :string, virtual: true

    # many_to_many :workouts, Allyourgym.Fitness.Workout, join_through: "workouts_exercises"
    # many_to_many :workouts, Allyourgym.Fitness.Workout, join_through: Allyourgym.Fitness.WorkoutExercise

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(exercise, attrs) do
    exercise
    |> cast(attrs, [:name, :notes, :youtube_link, :illustration_card_number, :muscle_group])
    |> validate_required([:name, :notes, :youtube_link, :illustration_card_number, :muscle_group])
  end

  def create_changeset(exercise, attrs, _metadata \\ []) do
    exercise
    |> cast(attrs, [:name, :notes, :youtube_link, :illustration_card_number, :muscle_group])
    |> validate_required([:name, :notes, :youtube_link, :illustration_card_number, :muscle_group])
  end

  def update_changeset(exercise, attrs, _metadata \\ []) do
    exercise
    |> cast(attrs, [:name, :notes, :youtube_link, :illustration_card_number, :muscle_group])
    |> validate_required([:name, :notes, :youtube_link, :illustration_card_number, :muscle_group])
  end
end
