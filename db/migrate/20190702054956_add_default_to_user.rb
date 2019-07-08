class AddDefaultToUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :resignation, :boolean, default: false
  end
end
