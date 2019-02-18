class Book < ActiveRecord::Base
  has_many :reviews

  attr_accessible :isbn, :title, :author, :category

end