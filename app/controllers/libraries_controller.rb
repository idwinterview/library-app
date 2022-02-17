# frozen_string_literal: true
# above line improves memory usage and speed of app
class LibrariesController < ApplicationController
  def index
    @library = LibraryService.find_library(params)
  end

  # def returned
  #   @customer = User.define_user(params[:user_id])
  #   LibraryService.return_book({customer: @customer, book_id: params[:id], flash: flash})
  #
  #   redirect_to list_books_path(user_id: @customer.id)
  # end
  #
  # def show
  #   @book = LibraryService.find_book(params['id'])
  # end
end
