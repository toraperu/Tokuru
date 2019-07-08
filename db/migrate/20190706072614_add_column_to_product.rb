class AddColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :caution, :text
    add_column :products, :sale_result, :string
  end
end
