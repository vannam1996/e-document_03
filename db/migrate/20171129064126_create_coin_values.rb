class CreateCoinValues < ActiveRecord::Migration[5.1]
  def change
    create_table :coin_values do |t|
      t.decimal :cost_per_coin

      t.timestamps
    end
  end
end
