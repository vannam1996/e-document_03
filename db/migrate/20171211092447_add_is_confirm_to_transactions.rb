class AddIsConfirmToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :is_confirm, :boolean, default: false
  end
end
