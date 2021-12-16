class ChangeRoutineExerciseQuantityToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :routine_exercises, :quantity, :float, null: false, default: 1.0
  end
end
