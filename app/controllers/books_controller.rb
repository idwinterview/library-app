class BooksController < ApplicationController
  
  def list
    @customer = Customer.find_customer(params[:customer_id])
    @customer_books = @customer.customer_books
  end
  
  def returned
    @customer = Customer.find_customer(params[:customer_id])
    book = CustomerBook.find_customers_books(params[:id], params[:customer_id])
    book.status = 'returned'
    
    if book.save
      flash[:success] = "Book has been marked as returned."
    else
      flash[:error] = "Book could not be marked as returned."
    end
    
    redirect_to :back
  end
end
