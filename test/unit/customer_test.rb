require "test_helper"
require 'mocha/mini_test'

#https://www.tutorialspoint.com/ruby-on-rails-2.1/rails-unit-testing.htm
#https://api.rubyonrails.org/classes/ActiveSupport/Testing/Assertions.html
#https://backend.turing.edu/module2/lessons/active_record_associations


class Customertest < ActiveSupport::TestCase
  context "associations" do 
    context "#customer_books" do 
      should "have many customer books" do 
        customer = create(:customer)
        create_list(:customer_book, 2, customer_id: customer.id)


        assert_equal 4, customer.customer_books.size
      end
    end

    context "#books" do 
      should "have many books" do 
        # FIX ME I am broken
        #was looking at the backend turing lesson to add to this
        #can explain more in person
        customer = create(:customer)
        puts "customer"
        binding.pry
        create(:customer_book, customer_id: customer.id, book_id: create(:book).id)
        create(:customer_book, customer_id: customer.id, book_id: create(:book).id)

        assert_equal 2, customer.books.size
      end
    end

    context "audio_books" do 
      should "have many audio books" do 
       
        should have_many(:audio_books)
        # TODO: Please Add
      end
    end

    context "physical_books" do 
      should "have many physical books" do 
        # TODO: Please Add
      end
    end
  end
end
