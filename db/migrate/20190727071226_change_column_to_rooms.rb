class ChangeColumnToRooms < ActiveRecord::Migration[5.2]
  def change
  	add_column :rooms, :buyer_id, :integer
  	add_column :rooms, :seller_id, :integer
  	remove_column :rooms, :user_id, :integer
  end
end
