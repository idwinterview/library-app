class AudioBook < Book
    belongs_to :Customer
    belongs_to :Librarian
end