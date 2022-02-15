class Customer < User
  has_many(:customer_books, dependent: :destroy)
  has_many(:books)
  has_many(:audio_books)
  has_many(:physical_books)

  def num_of_books
    self.books.length
  end

  def num_of_book_types
    books = {}
    self.books.each do |book|
      if books[book.category]
        books[book.category] += 1
      else
        books[book.category] = 1
      end
    books.length
  end

end
