defmodule Allyourgym.FitnessFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Allyourgym.Fitness` context.
  """

  @doc """
  Generate a workout.
  """
  def workout_fixture(attrs \\ %{}) do
    {:ok, workout} =
      attrs
      |> Enum.into(%{
        description: "some description",
        is_public: true,
        name: "some name",
        notes: "some notes"
      })
      |> Allyourgym.Fitness.create_workout()

    workout
  end
end
