require "rails_helper"

RSpec.describe Customer, type: :model do
  describe "associations" do
    describe "#customer_books" do
      it "has many customer books" do
        customer = create(:customer)
        create_list(:customer_book, 2, customer_id: customer.id)

        expect(customer.customer_books.size).to eq(2)
      end
    end

    describe "#books" do
      it "has many books" do
        customer = create(:customer)
        create(:customer_book, customer_id: customer.id, book_id: create(:book).id)
        create(:customer_book, customer_id: customer.id, book_id: create(:book).id)

        expect(customer.books.size).to eq(2)
      end
    end

    describe "audio_books" do
      it "has many audio books" do
        customer = create(:customer)
        audio_book_1 = create(:book, type: "AudioBook")
        audio_book_2 = create(:book, type: "AudioBook")
        create(:customer_book, customer_id: customer.id, book_id: audio_book_1.id)
        create(:customer_book, customer_id: customer.id, book_id: audio_book_2.id)

        expect(customer.audio_books.size).to eq(2)
      end

      it "does not return physical books" do
        customer = create(:customer)
        audio_book = create(:book, type: "AudioBook")
        physical_book = create(:book, type: "PhysicalBook")
        create(:customer_book, customer_id: customer.id, book_id: audio_book.id)
        create(:customer_book, customer_id: customer.id, book_id: physical_book.id)

        expect(customer.audio_books.size).to eq(1)
        expect(customer.audio_books[0].type).to eq("AudioBook")
      end
    end

    describe "physical_books" do
      it "has many physical books" do
        customer = create(:customer)
        physical_book_1 = create(:book, type: "PhysicalBook")
        physical_book_2 = create(:book, type: "PhysicalBook")
        create(:customer_book, customer_id: customer.id, book_id: physical_book_1.id)
        create(:customer_book, customer_id: customer.id, book_id: physical_book_2.id)

        expect(customer.physical_books.size).to eq(2)
      end

      it "does not return audio books" do
        customer = create(:customer)
        physical_book = create(:book, type: "PhysicalBook")
        audio_book = create(:book, type: "AudioBook")
        create(:customer_book, customer_id: customer.id, book_id: physical_book.id)
        create(:customer_book, customer_id: customer.id, book_id: audio_book.id)

        expect(customer.physical_books.size).to eq(1)
        expect(customer.physical_books[0].type).to eq("PhysicalBook")
      end
    end
  end
end