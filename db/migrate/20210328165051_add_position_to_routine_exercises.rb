class AddPositionToRoutineExercises < ActiveRecord::Migration[6.1]
  def change
    add_column :routine_exercises, :position, :integer, default: 0, null: false
  end
end
