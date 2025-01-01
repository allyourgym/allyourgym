defmodule AllyourgymWeb.ExerciseLive do
  use Backpex.LiveResource,
    adapter_config: [
      schema: Allyourgym.Fitness.Exercise,
      repo: Allyourgym.Repo,
      update_changeset: &Allyourgym.Fitness.Exercise.update_changeset/3,
      create_changeset: &Allyourgym.Fitness.Exercise.create_changeset/3
    ],
    layout: {AllyourgymWeb.Layouts, :admin},
    pubsub: [
      name: Allyourgym.PubSub,
      topic: "exercises",
      event_prefix: "exercises_"
    ]

  @impl Backpex.LiveResource
  def singular_name, do: "Exercise"

  @impl Backpex.LiveResource
  def plural_name, do: "Exercises"

@impl Backpex.LiveResource
  def filters do
    [
      muscle_group: %{
        module: AllyourgymWeb.Filters.ExerciseCategorySelect,
        label: "Category"
      }
    ]
  end

  @impl Backpex.LiveResource
  def fields do
    [
      name: %{
        module: Backpex.Fields.Text,
        label: "Name",
        searchable: true
      },
      notes: %{
        module: Backpex.Fields.Textarea,
        label: "Notes"
      },
      youtube_link: %{
        module: Backpex.Fields.URL,
        label: "Youtube Link"
      },
      illustration_card_number: %{
        module: Backpex.Fields.Number,
        label: "Illustration Card Number"
      },
      muscle_group: %{
        module: Backpex.Fields.Text,
        label: "Category"
      }
    ]
  end

  @impl Backpex.LiveResource
  def metrics do
    [
      total_exercises: %{
        module: Backpex.Metrics.Value,
        label: "Total Exercises",
        class: "lg:w-1/4",
        select: dynamic([p], count(p.id)),
        format: fn value ->
          Integer.to_string(value) <> " exercises"
        end
      }
    ]
  end
end
