class PhysicalBook < Book
    belongs_to :Customer
    belongs_to :Librarian
end