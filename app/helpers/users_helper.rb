# frozen_string_literal: true

module UsersHelper
  include ApplicationHelper

  def book_count(customer)
    books = CustomerBook.where("user_id = #{customer.id}")
    books.size
  end
end
