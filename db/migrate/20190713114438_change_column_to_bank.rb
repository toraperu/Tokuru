class ChangeColumnToBank < ActiveRecord::Migration[5.2]
  def change
  	change_column :banks, :name, :integer
  end
end
