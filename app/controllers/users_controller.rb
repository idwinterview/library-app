# frozen_string_literal: true

class UsersController < ApplicationController
  def index; end

  def list
    @customers = Customer.all
  end

  def show
    @customer = Customer.where(['id = ?', params[:id]]).first
    @customer_books = CustomerBook.where(['user_id = ?', params[:id]])
  end
end
