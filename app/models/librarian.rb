class Librarian < User
  has_many(:customer_books, dependent: :destroy)
  has_many :books, through: :customer_books
  has_many(:audio_books)
  has_many(:physical_books)
end