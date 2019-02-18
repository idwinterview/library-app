class Librarian::UsersController < Librarian::BaseController
  def show
    @customer = Customer.find(params[:id])
  end
end