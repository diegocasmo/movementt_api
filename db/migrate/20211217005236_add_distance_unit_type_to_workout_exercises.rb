class AddDistanceUnitTypeToWorkoutExercises < ActiveRecord::Migration[6.1]
  def change
    add_column :workout_exercises, :distance_unit_type, :integer, null: false, default: 0, limit: 2
  end
end
