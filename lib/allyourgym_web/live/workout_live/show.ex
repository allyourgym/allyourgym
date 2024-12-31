defmodule AllyourgymWeb.WorkoutLive.Show do
  use AllyourgymWeb, :live_view

  alias Allyourgym.Fitness

  @impl true


  def mount(%{"id" => id}, _session, socket) do
    workout = Fitness.get_workout_with_exercises!(id)
    workout_exercises = Enum.sort_by(workout.workout_exercises, & &1.position)
    # available_exercises = Fitness.list_exercises() |> Enum.reject(&(Enum.member?(workout_exercises, &1)))
  available_exercises =
  Fitness.list_exercises()
  |> Enum.reject(&(Enum.any?(workout_exercises, fn we -> we.exercise_id == &1.id end)))

# Transform the stream to a list of {label, value} tuples
    available_exercises_list =
      for exercise <- available_exercises, do: {exercise.name, exercise.id}

    {:ok,
     socket
     |> assign(:workout, workout)
     |> stream(:workout_exercises, workout_exercises)
     |> assign(:available_exercises_list, available_exercises_list) # Assign the transformed list
     |> assign(:available_exercises, available_exercises)
     |> stream(:available_exercises, available_exercises)}

    # {:ok,
    #  socket
    #  |> assign(:workout, workout)
    #  |> stream(:workout_exercises, workout_exercises)
    #  |> stream(:available_exercises, available_exercises)}
  end

  def mount(_params, _session, socket) do
    # {:ok, stream(socket, :workouts, Fitness.list_workouts())}
    workouts = Fitness.list_workouts()
    # {:ok, assign(socket, workouts: workouts)}
    {:ok, stream(socket, :workouts, workouts)}
    # {:ok, socket}
  end



  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:workout, Fitness.get_workout!(id))}
  end

  defp page_title(:show), do: "Show Workout"
  defp page_title(:edit), do: "Edit Workout"


#   @impl true
# def handle_event("reorder", %{"order" => ids}, socket) do
#   Enum.with_index(ids)
#   |> Enum.each(fn {id, index} ->
#     Fitness.update_workout_exercise_position(id, index + 1)
#   end)

#   {:noreply, reload_workout_exercises(socket)}
# end
# @impl true
# def handle_event("reorder", %{"order" => ids}, socket) do
#   Enum.with_index(ids)
#   |> Enum.each(fn {id, index} ->
#     # Convert string ID to integer
#     id = String.to_integer(id)
#     # Update the position
#     Fitness.update_workout_exercise_position(id, index + 1)
#   end)

#   # Reload workout and its exercises after reordering
#   workout = Fitness.get_workout_with_exercises!(socket.assigns.workout.id)
#   workout_exercises = Enum.sort_by(workout.workout_exercises, & &1.position)

#   {:noreply, assign(socket, workout_exercises: workout_exercises)}
# end

@impl true
def handle_event("reorder", %{"order" => ids}, socket) do
  # ids = Enum.map(ids, &String.to_integer/1)

  Enum.with_index(ids)
  |> Enum.each(fn {id, index} ->
    # Convert string ID to integer
    # id = String.to_integer(id)
    # Update the position
    Fitness.update_workout_exercise_position(id, index + 1)
  end)

  # Reload workout and its exercises after reordering
  workout = Fitness.get_workout_with_exercises!(socket.assigns.workout.id)
  workout_exercises = Enum.sort_by(workout.workout_exercises, & &1.position)

  {:noreply,
   socket
     |> stream(:workout_exercises, workout_exercises) }
end


# defp reload_workout_exercises(socket) do
#   workout = Fitness.get_workout_with_exercises!(socket.assigns.workout.id)
#   workout_exercises = Enum.sort_by(workout.workout_exercises, & &1.position)

#   assign(socket, workout_exercises: workout_exercises)
# end

# @impl true
# def handle_event("add_exercise", %{"exercise_id" => exercise_id}, socket) do
#   exercise_id = String.to_integer(exercise_id)
#   workout_id = socket.assigns.workout.id

#   case Fitness.add_exercise_to_workout(workout_id, exercise_id) do
#     {:ok, new_workout_exercise} ->
#       # Update the streams
#       {:noreply,
#        socket
#        |> stream_insert(:workout_exercises, new_workout_exercise)
#        |> stream_delete(:available_exercises, exercise_id)}

#     {:error, _changeset} ->
#       {:noreply, socket}
#   end
# end
#  @impl true
#     def handle_event("add_exercise", %{"exercise_id" => exercise_id}, socket) do

#     # def handle_event("add_exercise", %{"exercise" => %{"exercise_id" => exercise_id}}, socket) do
#         workout_id = socket.assigns.workout.id
#         exercise_id_int = String.to_integer(exercise_id)

#     case Fitness.add_exercise_to_workout(workout_id, exercise_id_int) do
#       {:ok, new_workout_exercise} ->
#         # Update the streams
#         {:noreply,
#          socket
#          |> stream_insert(:workout_exercises, new_workout_exercise)
#          |> stream_delete(:available_exercises, exercise_id_int)}
#       {:error, _changeset} ->
#         {:noreply, socket}
#     end
#   end

# @impl true
#   def handle_event("add_exercise", %{"exercise_id" => exercise_id}, socket) do
#     workout_id = socket.assigns.workout.id
#     exercise_id_int = String.to_integer(exercise_id)

#     case Fitness.add_exercise_to_workout(workout_id, exercise_id_int) do
#       {:ok, new_workout_exercise} ->
#           # # Find the item in the stream that matches the exercise_id
#           # item_to_delete =
#           #   socket.assigns.streams.available_exercises
#           #   |> Enum.find(fn {_, exercise} -> exercise.id == exercise_id_int end)
#           new_workout_exercise =
#             Allyourgym.Repo.preload(new_workout_exercise, :exercise)

#           # Find the item in the list that matches the exercise_id
#           item_to_delete =
#             socket.assigns.available_exercises
#             |> Enum.find(fn exercise -> exercise.id == exercise_id_int end)
#         {:noreply,
#          socket
#           |> stream_insert(:workout_exercises, new_workout_exercise)
#            |> stream_delete(:available_exercises, item_to_delete)}
#       {:error, _changeset} ->
#         {:noreply, socket}
#     end
#   end

 @impl true
  def handle_event("add_exercise", %{"exercise_id" => exercise_id}, socket) do
    workout_id = socket.assigns.workout.id
    exercise_id_int = String.to_integer(exercise_id)

    case Fitness.add_exercise_to_workout(workout_id, exercise_id_int) do
      {:ok, new_workout_exercise} ->

          # Eager load the exercise association
          new_workout_exercise =
            Allyourgym.Repo.preload(new_workout_exercise, :exercise)

        workout = Fitness.get_workout_with_exercises!(workout_id)
          available_exercises =
          Fitness.list_exercises()
          |> Enum.reject(&(Enum.any?(workout.workout_exercises, fn we -> we.exercise_id == &1.id end)))


           available_exercises_list =
            for exercise <- available_exercises, do: {exercise.name, exercise.id}

        # Find the item in the list that matches the exercise_id
        item_to_delete =
          socket.assigns.available_exercises
          |> Enum.find(fn exercise -> exercise.id == exercise_id_int end)


        {:noreply,
         socket
          |> stream_insert(:workout_exercises, new_workout_exercise)
           |> stream_delete(:available_exercises, item_to_delete)
            |> assign(:available_exercises, available_exercises)
           |> assign(:available_exercises_list, available_exercises_list)
           |> stream(:available_exercises, available_exercises)}
      {:error, _changeset} ->
        {:noreply, socket}
    end
  end

# @impl true
# def handle_event("add_exercise", %{"exercise_id" => exercise_id}, socket) do
#   exercise_id = String.to_integer(exercise_id)
#   workout_id = socket.assigns.workout.id

#   case Fitness.add_exercise_to_workout(workout_id, exercise_id) do
#     {:ok, _workout_exercise} ->
#       # Reload workout and available exercises
#       workout = Fitness.get_workout_with_exercises!(workout_id)
#       existing_exercise_ids = Enum.map(workout.workout_exercises, & &1.exercise_id)
#       available_exercises = Fitness.list_exercises() |> Enum.reject(&(&1.id in existing_exercise_ids))

#       {:noreply,
#        assign(socket,
#          workout: workout,
#          workout_exercises: Enum.sort_by(workout.workout_exercises, & &1.position),
#          available_exercises: available_exercises
#        )}

#     {:error, _changeset} ->
#       {:noreply, socket}
#   end
# end



end
