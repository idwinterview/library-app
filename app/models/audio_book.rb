class AudioBook < Book
  belongs_to :customer
  belongs_to :librarian
end