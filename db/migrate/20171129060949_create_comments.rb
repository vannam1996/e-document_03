class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user
      t.references :document

      t.timestamps
    end
  end
end
