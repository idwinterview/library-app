class Book < ActiveRecord::Base
  has_one :customer_book, as: :bookable
  has_one :customer, through: :customer_book
end
