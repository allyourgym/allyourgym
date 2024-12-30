defmodule Allyourgym.FitnessTest do
  @moduledoc """
  Tests for the Allyourgym.Fitness module.
  """
  use Allyourgym.DataCase

  alias Allyourgym.Fitness

  describe "workouts" do
    alias Allyourgym.Fitness.Workout

    import Allyourgym.FitnessFixtures

    @invalid_attrs %{name: nil, description: nil, is_public: nil, notes: nil}

    test "list_workouts/0 returns all workouts" do
      workout = workout_fixture()
      assert Fitness.list_workouts() == [workout]
    end

    test "get_workout!/1 returns the workout with given id" do
      workout = workout_fixture()
      assert Fitness.get_workout!(workout.id) == workout
    end

    test "create_workout/1 with valid data creates a workout" do
      valid_attrs = %{name: "some name", description: "some description", is_public: true, notes: "some notes"}

      assert {:ok, %Workout{} = workout} = Fitness.create_workout(valid_attrs)
      assert workout.name == "some name"
      assert workout.description == "some description"
      assert workout.is_public == true
      assert workout.notes == "some notes"
    end

    test "create_workout/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fitness.create_workout(@invalid_attrs)
    end

    test "update_workout/2 with valid data updates the workout" do
      workout = workout_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", is_public: false, notes: "some updated notes"}

      assert {:ok, %Workout{} = workout} = Fitness.update_workout(workout, update_attrs)
      assert workout.name == "some updated name"
      assert workout.description == "some updated description"
      assert workout.is_public == false
      assert workout.notes == "some updated notes"
    end

    test "update_workout/2 with invalid data returns error changeset" do
      workout = workout_fixture()
      assert {:error, %Ecto.Changeset{}} = Fitness.update_workout(workout, @invalid_attrs)
      assert workout == Fitness.get_workout!(workout.id)
    end

    test "delete_workout/1 deletes the workout" do
      workout = workout_fixture()
      assert {:ok, %Workout{}} = Fitness.delete_workout(workout)
      assert_raise Ecto.NoResultsError, fn -> Fitness.get_workout!(workout.id) end
    end

    test "change_workout/1 returns a workout changeset" do
      workout = workout_fixture()
      assert %Ecto.Changeset{} = Fitness.change_workout(workout)
    end
  end

  describe "exercises" do
    alias Allyourgym.Fitness.Exercise

    import Allyourgym.FitnessFixtures

    @invalid_attrs %{name: nil, notes: nil, youtube_link: nil, illustration_card_number: nil, muscle_group: nil}

    test "list_exercises/0 returns all exercises" do
      exercise = exercise_fixture()
      assert Fitness.list_exercises() == [exercise]
    end

    test "get_exercise!/1 returns the exercise with given id" do
      exercise = exercise_fixture()
      assert Fitness.get_exercise!(exercise.id) == exercise
    end

    test "create_exercise/1 with valid data creates a exercise" do
      valid_attrs = %{name: "some name", notes: "some notes", youtube_link: "some youtube_link", illustration_card_number: 42, muscle_group: "some muscle_group"}

      assert {:ok, %Exercise{} = exercise} = Fitness.create_exercise(valid_attrs)
      assert exercise.name == "some name"
      assert exercise.notes == "some notes"
      assert exercise.youtube_link == "some youtube_link"
      assert exercise.illustration_card_number == 42
      assert exercise.muscle_group == "some muscle_group"
    end

    test "create_exercise/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fitness.create_exercise(@invalid_attrs)
    end

    test "update_exercise/2 with valid data updates the exercise" do
      exercise = exercise_fixture()
      update_attrs = %{name: "some updated name", notes: "some updated notes", youtube_link: "some updated youtube_link", illustration_card_number: 43, muscle_group: "some updated muscle_group"}

      assert {:ok, %Exercise{} = exercise} = Fitness.update_exercise(exercise, update_attrs)
      assert exercise.name == "some updated name"
      assert exercise.notes == "some updated notes"
      assert exercise.youtube_link == "some updated youtube_link"
      assert exercise.illustration_card_number == 43
    end

    test "update_exercise/2 with invalid data returns error changeset" do
      exercise = exercise_fixture()
      assert {:error, %Ecto.Changeset{}} = Fitness.update_exercise(exercise, @invalid_attrs)
      assert exercise == Fitness.get_exercise!(exercise.id)
    end

    test "delete_exercise/1 deletes the exercise" do
      exercise = exercise_fixture()
      assert {:ok, %Exercise{}} = Fitness.delete_exercise(exercise)
      assert_raise Ecto.NoResultsError, fn -> Fitness.get_exercise!(exercise.id) end
    end

    test "change_exercise/1 returns a exercise changeset" do
      exercise = exercise_fixture()
      assert %Ecto.Changeset{} = Fitness.change_exercise(exercise)
    end
  end
end
