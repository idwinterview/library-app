class Book < ActiveRecord::Base
  
  attr_accessible :isbn, :title, :author, :category
    
end