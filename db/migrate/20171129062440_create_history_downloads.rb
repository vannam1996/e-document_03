class CreateHistoryDownloads < ActiveRecord::Migration[5.1]
  def change
    create_table :history_downloads do |t|
      t.references :user, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
