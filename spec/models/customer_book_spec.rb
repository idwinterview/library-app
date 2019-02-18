require "rails_helper"

RSpec.describe CustomerBook, type: :model do
  describe "#format_date" do
    it "formates the date to day month year" do
      customer_book = create(:customer_book, customer_id: create(:customer), book_id: create(:book).id)

      expect(customer_book.format_date).to eq(customer_book.created_at.to_date)
    end
  end

  describe "#book_title" do
    it "returns book title" do
      customer_book = create(:customer_book, customer_id: create(:customer), book_id: create(:book).id)

      expect(customer_book.book_title).to eq(customer_book.book.title)
    end
  end

  describe "#book_author" do
    it "returns book author" do
      customer_book = create(:customer_book, customer_id: create(:customer), book_id: create(:book).id)

      expect(customer_book.book_author).to eq(customer_book.book.author)
    end
  end
end
