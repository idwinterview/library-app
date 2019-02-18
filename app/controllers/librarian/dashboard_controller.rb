class Librarian::DashboardController < Librarian::BaseController
  def dashboard
    @customers = Customer.all
  end
end