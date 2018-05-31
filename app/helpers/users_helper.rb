module UsersHelper
  include ApplicationHelper
  
  
  def book_count(customer)
    books = CustomerBook.where("customer_id = #{customer.id}")
    books.size
  end
end
