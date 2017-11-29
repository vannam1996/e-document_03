class AddIsReportToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :is_report, :boolean, default: false
  end
end
