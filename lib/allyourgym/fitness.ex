defmodule Allyourgym.Fitness do
  @moduledoc """
  The Fitness context.
  """

  import Ecto.Query, warn: false
  alias Allyourgym.Repo

  alias Allyourgym.Fitness.Workout
  alias Allyourgym.Fitness.WorkoutExercise

  @doc """
  Returns the list of workouts.

  ## Examples

      iex> list_workouts()
      [%Workout{}, ...]

  """
  def list_workouts do
    Repo.all(Workout)
    # |> Repo.preload(:exercises)
  end

  def get_workout_with_exercises!(id) do
    # query = from w in Workout,
    #   where: w.id == ^id,
    #   join: we in assoc(w, :workout_exercises),
    #   join: e in assoc(we, :exercise),
    #   select: {w, we, e}

    # Repo.one(query)
    Repo.get!(Workout, id)
    |> Repo.preload(workout_exercises: :exercise)
    # |> Repo.preload(exercise: :exercise)
  end

  # def update_workout_exercise_position(id, position) do
  # IO.inspect(id, label: "Updating WorkoutExercise ID")
  # IO.inspect(position, label: "New Position")

  # workout_exercise = Repo.get!(WorkoutExercise, id)
  # IO.inspect(workout_exercise, label: "Fetched WorkoutExercise")

  #   workout_exercise
  #   |> Ecto.Changeset.change(position: position)
  #   |> Repo.update()
  # end

  def update_workout_exercise_position(id, position) do
    workout_exercise = Repo.get!(WorkoutExercise, id)
    changeset = WorkoutExercise.changeset(workout_exercise, %{position: position})

    Repo.update!(changeset)
  end

def add_exercise_to_workout(workout_id, exercise_id) do
  # Find the next position for the new exercise
  next_position =
    Repo.one(
      from we in WorkoutExercise,
      where: we.workout_id == ^workout_id,
      select: max(we.position)
    ) || 0

  # Create the new association
  %WorkoutExercise{}
  |> WorkoutExercise.changeset(%{
    workout_id: workout_id,
    exercise_id: exercise_id,
    position: next_position + 1
  })
  |> Repo.insert()
end


  @doc """
  Gets a single workout.

  Raises `Ecto.NoResultsError` if the Workout does not exist.

  ## Examples

      iex> get_workout!(123)
      %Workout{}

      iex> get_workout!(456)
      ** (Ecto.NoResultsError)

  """
  def get_workout!(id), do: Repo.get!(Workout, id)

  @spec create_workout(
          :invalid
          | %{optional(:__struct__) => none(), optional(atom() | binary()) => any()}
        ) :: any()
  @doc """
  Creates a workout.

  ## Examples

      iex> create_workout(%{field: value})
      {:ok, %Workout{}}

      iex> create_workout(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_workout(attrs \\ %{}) do
    %Workout{}
    |> Workout.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a workout.

  ## Examples

      iex> update_workout(workout, %{field: new_value})
      {:ok, %Workout{}}

      iex> update_workout(workout, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_workout(%Workout{} = workout, attrs) do
    workout
    |> Workout.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a workout.

  ## Examples

      iex> delete_workout(workout)
      {:ok, %Workout{}}

      iex> delete_workout(workout)
      {:error, %Ecto.Changeset{}}

  """
  def delete_workout(%Workout{} = workout) do
    Repo.delete(workout)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking workout changes.

  ## Examples

      iex> change_workout(workout)
      %Ecto.Changeset{data: %Workout{}}

  """
  def change_workout(%Workout{} = workout, attrs \\ %{}) do
    Workout.changeset(workout, attrs)
  end

  alias Allyourgym.Fitness.Exercise

  @doc """
  Returns the list of exercises.

  ## Examples

      iex> list_exercises()
      [%Exercise{}, ...]

  """
  def list_exercises do
    Repo.all(Exercise)
  end

  @doc """
  Gets a single exercise.

  Raises `Ecto.NoResultsError` if the Exercise does not exist.

  ## Examples

      iex> get_exercise!(123)
      %Exercise{}

      iex> get_exercise!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exercise!(id), do: Repo.get!(Exercise, id)

  @doc """
  Creates a exercise.

  ## Examples

      iex> create_exercise(%{field: value})
      {:ok, %Exercise{}}

      iex> create_exercise(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exercise(attrs \\ %{}) do
    %Exercise{}
    |> Exercise.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exercise.

  ## Examples

      iex> update_exercise(exercise, %{field: new_value})
      {:ok, %Exercise{}}

      iex> update_exercise(exercise, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exercise(%Exercise{} = exercise, attrs) do
    exercise
    |> Exercise.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a exercise.

  ## Examples

      iex> delete_exercise(exercise)
      {:ok, %Exercise{}}

      iex> delete_exercise(exercise)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exercise(%Exercise{} = exercise) do
    Repo.delete(exercise)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exercise changes.

  ## Examples

      iex> change_exercise(exercise)
      %Ecto.Changeset{data: %Exercise{}}

  """
  def change_exercise(%Exercise{} = exercise, attrs \\ %{}) do
    Exercise.changeset(exercise, attrs)
  end
end
