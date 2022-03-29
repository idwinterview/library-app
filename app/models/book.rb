class Book < ActiveRecord::Base
  belongs_to :customer
  belongs_to :librarian
    
end