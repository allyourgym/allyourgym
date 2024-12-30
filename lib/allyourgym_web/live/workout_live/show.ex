defmodule AllyourgymWeb.WorkoutLive.Show do
  use AllyourgymWeb, :live_view

  alias Allyourgym.Fitness

  @impl true


  def mount(%{"id" => id}, _session, socket) do
    workout = Fitness.get_workout_with_exercises!(id)
    workout_exercises = Enum.sort_by(workout.workout_exercises, & &1.position)

    {:ok, assign(socket, workout: workout, workout_exercises: workout_exercises)}
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
end
