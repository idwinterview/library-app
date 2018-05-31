class CustomerBook < ActiveRecord::Base
  belongs_to :customer
  belongs_to :book
  
  attr_accessible :customer_id, :book_id, :status
  
end