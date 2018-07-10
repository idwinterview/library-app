require "../test_helper"

class Customertest < ActiveSupport::TestCase
  context "associations" do 
    context "#customer_books" do 
      should "have many customer books" do 
        customer = create(:customer)
        create_list(:customer_book, 2, customer_id: customer.id)


        assert_equal 2, customer.customer_books.size
      end
    end

    context "#books" do 
      should "have many books" do 
        customer = create(:customer)
        create_list(:customer_book, 2, customer_id: customer.id, book_id: create(:book).id)

        assert_equal 2, customer.books.size
      end
    end

    context "audio_books" do 
      should "have many audio books" do
        customer = create(:customer)
        create_list(:audio_book, 2, customer_id: customer.id)

        assert_equal 2, customer.audio_books.size
      end
    end

    context "physical_books" do 
      should "have many physical books" do
        customer = create(:customer)
        create_list(:physical_book, 2, customer_id: customer.id)

        assert_equal 2, customer.physical_books.size
      end
    end
  end
end
