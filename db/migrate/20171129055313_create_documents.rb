class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.references :user
      t.references :category
      t.string :content

      t.timestamps
    end
    add_index :documents, [:user_id, :created_at]
  end
end
