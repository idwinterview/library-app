# frozen_string_literal: true

class Book < ActiveRecord::Base
  has_many :customer_books
  has_many :users, through: :customer_books
end
