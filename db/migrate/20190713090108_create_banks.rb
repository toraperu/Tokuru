class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.string :name
      t.string :branch
      t.string :number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
