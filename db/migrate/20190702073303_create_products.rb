class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.integer :user_id
    	t.string :name
    	t.integer :jacket_image_id
    	t.string :price
    	t.string :body

      t.timestamps
    end
  end
end
