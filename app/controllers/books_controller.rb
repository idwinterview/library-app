class BooksController < ApplicationController
  before_action :set_customer

  def list
    @customer = Customer.preload(:customer_books, :books)
                        .find_by(id: permitted_params[:customer_id])
    @customer_books = @customer.customer_books
  end

  def returned
    customer_book = retrieve_customer_book

    if customer_book.update(status: 'returned')
      flash[:success] = "Book has been marked as returned."
    else
      flash[:error] = "Book could not be marked as returned."
    end

    redirect_to :back
  end

  def check_out
    customer_book = retrieve_customer_book

    if customer_book.update(status: 'checked out')
      flash[:success] = "Book has been marked as checked out."
    else
      flash[:error] = "Book could not be marked as checked out."
    end

    redirect_to :back
  end

  private
  def set_customer
    @customer = Customer.find_by(id: permitted_params[:customer_id])
  end

  def retrieve_customer_book
    CustomerBook.find_by(bookable_id: permitted_params[:id])
  end

  def permitted_params
    params.permit(:id, :customer_id)
  end
end
