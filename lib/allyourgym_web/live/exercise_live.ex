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
  def fields do
    [
      name: %{
        module: Backpex.Fields.Text,
        label: "Name"
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
end
