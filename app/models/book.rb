require 'csv'

class Book < ActiveRecord::Base
  has_many(:customer_books, order: "created_at desc", dependent: :destroy)
  has_many(:customers, through: :customer_books, order: "created_at desc")
  attr_accessible :isbn, :title, :author, :category, :type
    
  def self.import(file)
    CSV.foreach(file.path, headers: :true) do |row|
      book = Book.find_or_initialize_by_isbn(row["isbn"])
      book.update_attributes row.to_hash
    end 
  end

  def self.order_by_latest
    Book.order("created_at DESC")
  end
end