class UsersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @customer_books = @customer.customer_books

    unless current_user.id.to_s == params[:id]
      flash[:notice] = "You don't have access to this page."
      redirect_to user_path(current_user)
    end
  end
end
