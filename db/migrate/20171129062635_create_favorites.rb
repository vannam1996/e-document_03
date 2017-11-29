class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :document, foreign_key: true
      t.boolean :is_favorite, default: false

      t.timestamps
    end
  end
end
