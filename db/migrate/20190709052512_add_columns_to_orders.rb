class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :contact_info, :string
  end
end
