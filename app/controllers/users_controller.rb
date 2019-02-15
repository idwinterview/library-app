class UsersController < ApplicationController
  def index
  end

  def list
    set_customers
  end

  def show
    set_customer
    set_customer_books
  end

  private
  def set_customers
    @customers = Customer.all
  end

  def set_customer
    @customer = Customer.find_by(id: permitted_params[:id])
  end

  def set_customer_books
    @customer_books = CustomerBook.where(customer_id: permitted_params[:id])
  end

  def permitted_params
    params.permit(:id)
  end
end
