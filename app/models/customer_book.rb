class CustomerBook < ActiveRecord::Base
  belongs_to :customer
  belongs_to :book
  
  attr_accessor :customer_id, :book_id, :status
  
end