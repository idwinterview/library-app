class BooksController < ApplicationController
  
  def list
    @customer = Customer.where(["id = ?", params[:customer_id]]).first
    @customer_books = CustomerBook.where(["customer_id = ?", params[:customer_id]])
  end
  
  def returned
    @customer = Customer.where(["id = ?", params[:customer_id]]).first
    book = CustomerBook.where(["book_id = ? and customer_id = ?", params[:id], params[:customer_id]]).first
    book.status = 'returned'
    
    if book.save
      flash[:success] = "Book has been marked as returned."
    else
      flash[:error] = "Book could not be marked as returned."
    end
    
    redirect_to :back
  end
end
