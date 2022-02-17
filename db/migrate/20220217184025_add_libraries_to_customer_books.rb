class AddLibrariesToCustomerBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :customer_books, :library, foreign_key: true
  end
end
