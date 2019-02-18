class Customer < User
  has_many(:customer_books, order: "created_at desc", dependent: :destroy)
  has_many(:books, through: :customer_books, order: "created_at desc")
  has_many(:audio_books, through: :customer_books, conditions: { :type => 'AudioBook' }, source: :book, order: "created_at desc")
  has_many(:physical_books, through: :customer_books, conditions: { :type => 'PhysicalBook' }, source: :book, order: "created_at desc")

  def audio_book_count
    audio_books.count
  end

  def physical_book_count
    physical_books.count
  end
end
