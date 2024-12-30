defmodule Allyourgym.FitnessFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Allyourgym.Fitness` context.
  """

  @doc """
  Generate a workout.
  """
  def workout_fixture(attrs \\ %{}) do
    user = attrs[:created_by] || Allyourgym.AccountsFixtures.user_fixture()

    {:ok, workout} =
      attrs
      |> Enum.into(%{
        description: "some description",
        is_public: true,
        is_prebuilt: false,
        name: "some name",
        notes: "some notes",
        created_by: user.id
      })
      |> Allyourgym.Fitness.create_workout()

    workout
  end

  @doc """
  Generate a exercise.
  """
  def exercise_fixture(attrs \\ %{}) do
    {:ok, exercise} =
      attrs
      |> Enum.into(%{
        illustration_card_number: 42,
        name: "some name",
        notes: "some notes",
        youtube_link: "some youtube_link",
        muscle_group: "some muscle_group"
      })
      |> Allyourgym.Fitness.create_exercise()

    exercise
  end
end
