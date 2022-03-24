class CustomersController < ApplicationController
  
  def index
    @customers = Customer.all
  end
  
  
  def show
    @customer = Customer.find(params[:id])
    # @customer_books = CustomerBook.where(params[:id])
    @customer_books = @customer.customer_books
  end
end

  def reports
    @customer = Customer.find(params[:id])
    @customers = Customer.all
    @bookTypes = []
    shorter = @customer.customer_books
    for i in shorter.length
       bookTypes << shorter[i]
    end
    return bookTypes.uniq

  end

# create adds to db

# new creates blank canvas to make new 

# create
# READ
# EDIT
# DESTROY


