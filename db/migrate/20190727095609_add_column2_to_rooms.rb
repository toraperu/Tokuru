class AddColumn2ToRooms < ActiveRecord::Migration[5.2]
  def change
  	add_column :rooms, :permitted?, :boolean, default: false
  end
end
