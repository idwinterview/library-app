class Customer < User
  has_many(:customer_books, order: "created_at desc", dependent: :destroy)
  has_many(:books, through: :customer_books, order: "created_at desc")
  has_many(:audio_books, through: :customer_books, source: :book, order: "created_at desc")
  has_many(:physical_books, through: :customer_books, source: :book, order: "created_at desc")
end
 