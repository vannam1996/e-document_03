class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :content

      t.timestamps
    end
    add_index :documents, [:user_id, :created_at]
    add_index :documents, :content
  end
end
