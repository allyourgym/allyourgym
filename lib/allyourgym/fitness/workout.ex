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
    field :created_by_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(workout, attrs) do
    workout
    |> cast(attrs, [:name, :description, :is_public, :notes])
    |> validate_required([:name, :description, :is_public, :notes])
  end
end
