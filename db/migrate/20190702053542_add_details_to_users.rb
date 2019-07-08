class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :real_name, :string
    add_column :users, :profile_image_id, :integer
    add_column :users, :resignation, :boolean
  end
end
