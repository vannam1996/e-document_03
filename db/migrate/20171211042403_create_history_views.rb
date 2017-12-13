class CreateHistoryViews < ActiveRecord::Migration[5.1]
  def change
    create_table :history_views do |t|
      t.references :user
      t.references :document

      t.timestamps
    end
  end
end
