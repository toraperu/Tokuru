class RemovePaymentFromOrders < ActiveRecord::Migration[5.2]
  def change
  	remove_column :orders, :payment
  end
end
