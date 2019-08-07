class AddColumnToBanks < ActiveRecord::Migration[5.2]
  def change
  	add_column :banks, :holder, :string
  end
end
