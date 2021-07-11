class CreateWorkoutExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_exercises do |t|
      t.references :workout, null: false, foreign_key: { on_update: :restrict, on_delete: :cascade }
      t.string :name, null: false, default: '', limit: 255

      t.integer :category_type, null: false, default: 0, limit: 2
      t.integer :movement_type, null: false, default: 0, limit: 2
      t.integer :weight_unit_type, null: false, default: 0, limit: 2
      t.integer :quantity, null: false, default: 1
      t.float :weight, null: false, default: 0
      t.integer :rest_seconds, null: false, default: 0

      t.timestamps
    end
  end
end
