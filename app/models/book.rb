class Book < ActiveRecord::Base
  has_many(:customer_books, order: "created_at desc", dependent: :destroy)
  has_many(:customers, through: :customer_books, order: "created_at desc")
  attr_accessible :isbn, :title, :author, :category
    
end