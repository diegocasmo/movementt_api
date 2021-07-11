class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.references :user, null: false, foreign_key: { on_update: :restrict, on_delete: :cascade }
      t.string :name, limit: 255, default: '', null: false
      t.integer :rounds, null: false, default: 1
      t.integer :rest_seconds, null: false, default: 0
      t.integer :rounds_completed, null: false, default: 0
      t.integer :elapsed_ms, null: false, default: 1
      t.datetime :started_at, null: false
      t.datetime :completed_at, null: false

      t.timestamps
    end
  end
end
