class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :uid, null:false, default: '', limit: 255
      t.string :email, null: false, default: '', limit: 255
      t.boolean :verified, null: false, default: false

      t.timestamps null: false
    end

    add_index :users, :uid, unique: true
    add_index :users, :email, unique: true
  end
end
