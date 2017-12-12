class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user
      t.references :document
      t.boolean :is_favorite

      t.timestamps
    end
  end
end
