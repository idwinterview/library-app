class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email_address(params[:email_address])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.librarian?
        redirect_to librarian_dashboard_path
      else
        redirect_to user_path(user)
      end
      flash[:success] = "Welcome #{current_user.first_name} #{current_user.last_name}!"
    else
      flash.now[:error] = "Incorrect Credentials."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Signed Out"
    redirect_to '/'
  end
end