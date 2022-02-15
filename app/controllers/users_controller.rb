class UsersController < ApplicationController

  def index
  end

  def create
    @user = User.create(user_params)
  end

  def list
    @customers = Customer.all
  end

  def user_type type
    @users = User.all.filter { |user| user.type == type  }
  end

  def show
    @customer = Customer.where(["id = ?", params[:id]]).first
    @customer_books = CustomerBook.where(["customer_id = ?", params[:id]])
  end

  def update
    @user.update(user_params)
  end

  def destroy
    @user.destroy
  end

  def user_params
    params.permit(:first_name, :last_name, :type)
  end

end
