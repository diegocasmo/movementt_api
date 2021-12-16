class ChangeWorkoutExerciseQuantityToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :workout_exercises, :quantity, :float, null: false, default: 1.0
  end
end
