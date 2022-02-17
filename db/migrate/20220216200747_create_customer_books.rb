# frozen_string_literal: true

class CreateCustomerBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_books do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status, limit: 15, default: 'checked out'

      t.timestamps
    end
  end
end
