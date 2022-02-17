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
    @customer = User.define_user(params[:user_id])
    LibraryService.return_book({customer: @customer, book_id: params[:id], flash: flash})

    redirect_to list_books_path(user_id: @customer.id)
  end

  def show
    @book = LibraryService.find_book(params['id'])
  end
end
