module UsersHelper
  include ApplicationHelper

  def book_count(customer)
    customer.books.count
  end

  def audio_book_count(customer)
    customer.audio_books.count
  end

  def physical_book_count(customer)
    customer.physical_books.count
  end
end
