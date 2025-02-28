defmodule AllyourgymWeb.ExerciseLive.Index do
  use AllyourgymWeb, :live_view

  alias Allyourgym.Fitness
  alias Allyourgym.Fitness.Exercise

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :exercises, Fitness.list_exercises())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Exercise")
    |> assign(:exercise, Fitness.get_exercise!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Exercise")
    |> assign(:exercise, %Exercise{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Exercises")
    |> assign(:exercise, nil)
  end

  @impl true
  def handle_info({AllyourgymWeb.ExerciseLive.FormComponent, {:saved, exercise}}, socket) do
    {:noreply, stream_insert(socket, :exercises, exercise)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    exercise = Fitness.get_exercise!(id)
    {:ok, _} = Fitness.delete_exercise(exercise)

    {:noreply, stream_delete(socket, :exercises, exercise)}
  end
end
