defmodule Allyourgym.Repo.Migrations.CreateExercises do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add :name, :string
      add :base_resistance, :float
      add :notes, :text
      add :youtube_link, :string
      add :illustration_card_number, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
