class AddFinishToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :finish, :boolean
  end
end
