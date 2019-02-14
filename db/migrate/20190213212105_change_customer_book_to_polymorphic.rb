class ChangeCustomerBookToPolymorphic < ActiveRecord::Migration
  def change
    rename_column :customer_books, :book_id, :bookable_id
    add_column :customer_books, :bookable_type, :string
  end
end
