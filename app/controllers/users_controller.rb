class UsersController < ApplicationController
  
  def index
  end
  
  def list
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.where(["id = ?", params[:id]]).first
    @customer_books = CustomerBook.where(["customer_id = ?", params[:id]])
  end
end
