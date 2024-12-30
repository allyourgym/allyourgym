defmodule Allyourgym.Repo.Migrations.RemoveBaseResistanceFromExercise do
  use Ecto.Migration

  def change do
    alter table(:exercises) do
      remove :base_resistance
    end
  end
end
