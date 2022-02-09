class Customer < User
  has_many(:customer_books, dependent: :destroy)
  has_many(:books)
  has_many(:audio_books)
  has_many(:physical_books)
end
