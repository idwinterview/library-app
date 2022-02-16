class CreateCustomers < ActiveRecord::Migration[6.1]
  def up
    create_table :customers, :force => true do |t|

      t.timestamps
    end
  end

  def down
    drop_table :customers
  end
end
