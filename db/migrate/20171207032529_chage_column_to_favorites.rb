class ChageColumnToFavorites < ActiveRecord::Migration[5.1]
  def change
    change_column :favorites, :is_favorite, :boolean,default: false
  end
end
