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
        create(:customer_book, customer_id: customer.id, book_id: create(:book).id)
        create(:customer_book, customer_id: customer.id, book_id: create(:book).id)

        expect(customer.books.count).to eql(2)
      end
    end

    context "audio_books" do
      it "has many audio books" do
        # TODO: Please Add
      end
    end

    context "physical_books" do
      it "has many physical books" do
        # TODO: Please Add
      end
    end
  end
end
