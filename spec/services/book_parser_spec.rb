require "rails_helper"

describe BookParser, type: :model do
  describe ".book_feed" do
    it "returns books" do
      books = BookParser.book_feed
      book = books.first

      expect(books.count).to eq(10)
      expect(book.title).to eq("Bret")
      expect(book.author).to eq("Leanne Graham")
    end
  end
end