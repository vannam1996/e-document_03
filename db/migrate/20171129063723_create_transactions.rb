class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :user
      t.integer :coin
      t.decimal :cost_at_buy

      t.timestamps
    end
    add_index :transactions, [:user_id, :created_at]
  end
end
