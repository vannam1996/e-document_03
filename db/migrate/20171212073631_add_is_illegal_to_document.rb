class AddIsIllegalToDocument < ActiveRecord::Migration[5.1]
  def change
    add_column :documents, :is_illegal, :boolean, default: false
  end
end
