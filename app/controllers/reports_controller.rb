class ReportsController < ApplicationController
  
  def customer_book_counts
    @customers = Customer.all
  end
  
end
