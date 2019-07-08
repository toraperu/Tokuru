class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user_id
      t.integer :product_id
      t.integer :star

      t.timestamps
    end
  end
end
