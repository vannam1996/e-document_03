class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :coin
      t.boolean :is_admin, default: false
      t.string :password_digest
      t.integer :down_count
      t.integer :up_count
      t.datetime :login_last_at
      t.string :avatar

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :name
  end
end
