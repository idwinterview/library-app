class Book < ActiveRecord::Base
  has_many :reviews

  attr_accessible :isbn, :title, :author, :category, :type

  validates_presence_of :title
  validates_uniqueness_of :title
end