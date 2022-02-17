class LibraryService

  def self.return_book(data)
    book = find_book(data[:book_id])
    customer_book_record = CustomerBook.where(['book_id = ? and user_id = ?', book.id, data[:customer]]).first
    customer_book_record.status = 'returned'
    flash_book_return_status(customer_book_record, data[:flash])
  end

  def self.find_book(id)
    book = Book.where(id: id)
    return 'Book not found' if book == []
    book.first
  end

  def self.flash_book_return_status(book_record, flash_message)
    if book_record.save
      flash_message[:success] = 'Book has been marked as returned.'
    else
      flash_message[:error] = 'Book could not be marked as returned.'
    end
  end
end
