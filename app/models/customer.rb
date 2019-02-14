class Customer < User
  has_many(:customer_books, -> { order "created_at desc" }, dependent: :destroy)
  has_many(:books, -> { order "created_at desc" }, through: :customer_books,
    source: :bookable, source_type: 'Book')
  has_many(:audio_books, -> { order "created_at desc" }, through: :customer_books,
    source: :bookable, source_type: 'AudioBook')
  has_many(:physical_books,-> { order "created_at desc" }, through: :customer_books,
    source: :bookable, source_type: 'PhysicalBook')
end
