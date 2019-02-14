class UsersController < ApplicationController
  before_action :set_view

  def index
  end

  def list
    set_customers
    @view ||= 'librarian'
  end

  def show
    @customer = retrieve_customer
    @customer_books = @customer.customer_books
    @view ||= 'customer'
  end

  private
  def set_customers
    @customers = Customer.all
  end

  def set_view
    @view = permitted_params[:view]
  end

  def retrieve_customer
    Customer.preload(:customer_books, :books)
            .find_by(id: permitted_params[:id])
  end

  def permitted_params
    params.permit(:id, :view)
  end
end
