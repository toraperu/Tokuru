class ChangeColumnDefaultToProduct < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :finish, :boolean, default: "false"
  end
end
