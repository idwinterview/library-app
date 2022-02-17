class Library < ActiveRecord::Base
  validates_presence_of :name, :phone_number
  validates_uniqueness_of :name, :phone_number
  has_one :address
  has_many :books
  has_many :customers
  has_many :librarians
  has_many :physical_books
  has_many :audio_books
  has_many :customer_books
end
