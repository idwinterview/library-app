# frozen_string_literal: true
# above line improves memory usage and speed of app
class BooksController < ApplicationController
  def list
    @customer = User.define_user(params[:user_id])
    @customer_books = if @customer.instance_of?(Librarian)
                        CustomerBook.all
                      else
                        CustomerBook.where(['user_id = ?', @customer.id])
                      end
  end

  def returned
    @customer = Customer.find(params[:user_id])
    book = CustomerBook.where(['book_id = ? and user_id = ?', params[:id], params[:user_id]]).first
    book.status = 'returned'

    if book.save
      flash[:success] = 'Book has been marked as returned.'
    else
      flash[:error] = 'Book could not be marked as returned.'
    end

    redirect_to list_books_path(user_id: @customer.id)
  end

  def show
    @book = Book.find(params['id'])
  end
end
