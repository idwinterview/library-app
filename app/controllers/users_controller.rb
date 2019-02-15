class UsersController < ApplicationController
  def index
  end

  def list
    set_customers
    @view = 'librarian'
  end

  def show
    @customer = retrieve_customer
    @customer_books = @customer.customer_books
    @view = 'customer'
  end

  private
  def set_customers
    @customers = Customer.all
  end

  def retrieve_customer
    Customer.preload(:customer_books, :books)
            .find_by(id: permitted_params[:id])
  end

  def permitted_params
    params.permit(:id)
  end
end
