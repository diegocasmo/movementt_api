class CreateRoutines < ActiveRecord::Migration[6.1]
  def change
    create_table :routines do |t|
      t.references :user, null: false, foreign_key: { on_update: :restrict, on_delete: :cascade }
      t.string :name, null: false, default: '', limit: 255
      t.integer :rounds, null: false, default: 1
      t.integer :rest_seconds, null: false, default: 0

      t.timestamps null: false
    end
  end
end
