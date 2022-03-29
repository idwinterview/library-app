class PhysicalBook < Book
  belongs_to :customers
  belongs_to :librarian
end