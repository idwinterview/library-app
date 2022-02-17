class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :number
      t.string :street
      t.string :second_address_line
      t.integer :zip
      t.string :state, limit: 2

      t.timestamps
    end
  end
end
