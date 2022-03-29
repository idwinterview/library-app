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
       
        customer = Customer.create({first_name: 'mari', last_name: 'preciado'})

        @customer_1 = @customers.create!(:customer_book, customer_id: customer.id, book_id: create(:book).id)
        @customer_2 = @customers.create!(:customer_book, customer_id: customer.id, book_id: create(:book).id)
        assert_equal 2, @customers.all
      end
    end

    context "audio_books" do 
      should "have many audio books" do 
       
        should have_many(:audio_books)
        it { should have_many(:audio_books)}
        # TODO: Please Add
      end
    end

    context "physical_books" do 
      should "have many physical books" do 
        
        customer = create(:customer)
        harry_potter = PhysicalBook.create(isbn: '0439708184', title: "Harry Potter and the Sorcerer's Stone", author: 'J.K. Rowling', category: 'fantasy')
        rails = PhysicalBook.create(isbn: '0470081201', title: "Ruby on Rails For Dummies", author: 'Barry A. Burd', category: 'technology')
        CustomerBook.create(customer_id: customer.id, book_id: rails.id)
        CustomerBook.create(customer_id: customer.id, book_id: harry_potter.id)
       
        # TODO: Please Add
        it { should have_many(:physical_books) }
      end
    end
  end
end
