defmodule Allyourgym.Repo.Migrations.AddIsPrebuiltAndCreatedByToWorkouts do
  use Ecto.Migration

  def change do
    alter table(:workouts) do
      add :is_prebuilt, :boolean, default: false, null: false
    end

  end
end
