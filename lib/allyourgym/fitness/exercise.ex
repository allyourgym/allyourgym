defmodule Allyourgym.Fitness.Exercise do
  @moduledoc """
  This module defines the Exercise schema and changeset functions.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "exercises" do
    field :name, :string
    field :base_resistance, :float
    field :notes, :string
    field :youtube_link, :string
    field :illustration_card_number, :integer

    many_to_many :workouts, Allyourgym.Fitness.Workout, join_through: "workouts_exercises"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(exercise, attrs) do
    exercise
    |> cast(attrs, [:name, :base_resistance, :notes, :youtube_link, :illustration_card_number])
    |> validate_required([:name, :base_resistance, :notes, :youtube_link, :illustration_card_number])
  end
end
