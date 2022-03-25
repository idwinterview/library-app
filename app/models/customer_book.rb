class CustomerBook < ActiveRecord::Base
  belongs_to :Customer
  belongs_to :Book
  
  
end