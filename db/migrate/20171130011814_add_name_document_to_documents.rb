class AddNameDocumentToDocuments < ActiveRecord::Migration[5.1]
  def change
    add_column :documents, :name_document, :string
  end
end
