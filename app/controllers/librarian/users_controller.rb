class Librarian::UsersController < Librarian::BaseController
  def show
    @customer = Customer.find(params[:id])
  end

  def customer_books_report
    @customers = Customer.all
  end
end