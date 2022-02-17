# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[6.1]
  def up
    create_table :customers, force: true, &:timestamps
  end

  def down
    drop_table :customers
  end
end
