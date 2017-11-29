class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.boolean :is_accept, default: false
      t.integer :sender_id
      t.integer :accepter_id

      t.timestamps
    end
    add_index :friends, :sender_id
    add_index :friends, :accepter_id
    add_index :friends, [:sender_id, :accepter_id], unique: true
  end
end
