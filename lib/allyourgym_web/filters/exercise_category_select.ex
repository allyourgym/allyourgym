defmodule AllyourgymWeb.Filters.ExerciseCategorySelect do
  use Backpex.Filters.Select

  @impl Backpex.Filter
  def label, do: "Category"

  @impl Backpex.Filters.Select
  def prompt, do: "Select category ..."

  @impl Backpex.Filters.Select
  def options do
    query =
      from c in Allyourgym.Fitness.Exercise,
        distinct: c.muscle_group,
        select: {c.muscle_group, c.muscle_group}

    Allyourgym.Repo.all(query)
  end
end
