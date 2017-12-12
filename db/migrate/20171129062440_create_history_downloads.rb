class CreateHistoryDownloads < ActiveRecord::Migration[5.1]
  def change
    create_table :history_downloads do |t|
      t.references :user
      t.references :document

      t.timestamps
    end
  end
end
