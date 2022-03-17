class Librarian < User
    has_many(:customers)
    has_many(:books)
    has_many(:audio_books)
    has_many(:physical_books)

end