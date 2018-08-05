require "test_helper"

class CustomerBookTest < ActiveSupport::TestCase
  context "methods" do
    context "find_customers books" do
      should "return the customer book record" do
        customer = create(:customer)
        customer_book = create(:customer_book, customer_id: customer.id, book_id: create(:book).id)
        returned_customer_book = CustomerBook.where(["book_id = ? and customer_id = ?", customer_book.book_id, customer]).first

        assert_equal customer_book, returned_customer_book
      end
    end
  end
end