class BooksController < ApplicationController

  def list
    @customer = Customer.where(["id = ?", params[:user_id]]).first
    @customer_books = CustomerBook.where(["user_id = ?", params[:user_id]])
  end

  def returned
    @customer = Customer.where(["id = ?", params[:user_id]]).first
    book = CustomerBook.where(["book_id = ? and user_id = ?", params[:id], params[:user_id]]).first
    book.status = 'returned'

    if book.save
      flash[:success] = "Book has been marked as returned."
    else
      flash[:error] = "Book could not be marked as returned."
    end

    redirect_to list_books_path(user_id: @customer.id)
  end
end
