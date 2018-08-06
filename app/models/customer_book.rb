class CustomerBook < ActiveRecord::Base
  belongs_to :customer
  belongs_to :book
  
  attr_accessible :customer_id, :book_id, :status
  
  def self.find_customers_books(book, customer)
    CustomerBook.where(["book_id = ? and customer_id = ?", book, customer]).first
  end
end