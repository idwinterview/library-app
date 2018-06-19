class Customer < User
  has_many(:customer_books, order: "created_at desc", dependent: :destroy)
  has_many(:books, order: "created_at desc")
  has_many(:audio_books, order: "created_at desc")
  has_many(:physical_books, order: "created_at desc")
end
