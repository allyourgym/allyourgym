defmodule Allyourgym.FitnessTest do
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
end
