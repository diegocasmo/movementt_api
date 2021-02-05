class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.references :user, null: false, foreign_key: { on_update: :restrict, on_delete: :cascade }
      t.string :name, null: false, default: '', limit: 255
      t.integer :movement_type, null: false, default: 0, limit: 2

      t.timestamps null: false
    end
  end
end
