class DropTableBankbook < ActiveRecord::Migration[5.2]
  def change
  	drop_table :bankbooks
  end
end
