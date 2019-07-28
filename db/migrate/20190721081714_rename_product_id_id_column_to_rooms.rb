class RenameProductIdIdColumnToRooms < ActiveRecord::Migration[5.2]
  def change
  	rename_column :rooms, :product_id_id, :product_id
  end
end
