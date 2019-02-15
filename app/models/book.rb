class Book < ActiveRecord::Base
  has_one :customer_book, as: :bookable
  has_one :customer, through: :customer_book

  def status
    customer_book&.status
  end

  def checked_out?
    status == 'checked out'
  end

  def check_in
    customer_book.update(status: 'returned')
  end
end
