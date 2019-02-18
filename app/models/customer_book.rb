class CustomerBook < ActiveRecord::Base
  belongs_to :customer
  belongs_to :book

  attr_accessible :customer_id, :book_id, :status

  def format_date
    created_at.to_date
  end

  def book_title
    book.title
  end

  def book_author
    book.author
  end
end