class ChangeColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :my_skill, :string
  end
end
