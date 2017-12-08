class AddTypeCoinToCoinValue < ActiveRecord::Migration[5.1]
  def change
    add_column :coin_values, :type_buy, :string
  end
end
