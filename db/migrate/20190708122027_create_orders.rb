class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.string :price
      t.string :payment
      t.string :contact

      t.timestamps
    end
  end
end
