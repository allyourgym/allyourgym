defmodule Allyourgym.Repo.Migrations.AddMuscleGroupToExercise do
  use Ecto.Migration

  def change do
    alter table(:exercises) do
      add :muscle_group, :string, null: false, default: "unspecified"
    end
  end
end
