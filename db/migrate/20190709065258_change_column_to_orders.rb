class ChangeColumnToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :other_contact, :string
  	change_column :orders, :contact, :integer
  end
end
