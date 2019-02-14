require 'rails_helper'

describe Customer do
  context "associations" do
    context "#customer_books" do
      it 'has many customer books' do
        customer = create(:customer)
        create_list(:customer_book, 2, customer_id: customer.id)

        expect(customer.customer_books.count).to eql(2)
      end
    end

    context "#books" do
      it 'has many books' do
        customer = create(:customer)
        create(:customer_book, customer_id: customer.id,
          bookable_id: create(:book).id, bookable_type: 'Book')
        create(:customer_book, customer_id: customer.id,
          bookable_id: create(:book).id, bookable_type: 'Book')

        expect(customer.books.count).to eql(2)
      end

      it 'creates the customer_books' do
        customer = create(:customer)
        books = create_list(:book, 2)
        customer.books = books
        customer.save

        books.each do |book|
          expect(CustomerBook.where(bookable: book, customer: customer))
            .to be_present
        end
      end
    end

    context "audio_books" do
      it "has many audio books" do
        customer = create(:customer)
        audio_books = create_list :audio_book, 2
        customer.audio_books << audio_books

        expect(customer.audio_books).to match_array(audio_books)
      end
    end

    context "physical_books" do
      it "has many physical books" do
        customer = create(:customer)
        physical_books = create_list(:physical_book, 2)
        customer.physical_books << physical_books

        expect(customer.physical_books).to match_array(physical_books)
      end
    end
  end
end
