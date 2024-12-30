alias Allyourgym.Repo
alias Allyourgym.Fitness.{Workout, Exercise, WorkoutExercise}
import Ecto.Query

# Find exercises by their illustration_card_number values
exercise_card_numbers = [56, 57, 54, 73, 76]
exercises = Repo.all(from e in Exercise, where: e.illustration_card_number in ^exercise_card_numbers)

# # Create the workout
# {:ok, workout} = Repo.insert(%Workout{
#   name: "Core Strength and Stability #1",
#   description: "A workout focused on core strength and stability.",
#   is_public: true,
#   is_prebuilt: true,
#   notes: "Great for building foundational strength."
# })

# Associate the exercises with the workout, maintaining order
Enum.with_index(exercises)
|> Enum.each(fn {exercise, index} ->
  Repo.insert!(%WorkoutExercise{
    workout_id: 1, #workout.id,
    exercise_id: exercise.id,
    position: index + 1
  })
end)

IO.puts("Seeded 'Core Strength and Stability #1' workout with exercises.")
