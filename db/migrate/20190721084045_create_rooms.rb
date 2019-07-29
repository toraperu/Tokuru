class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
