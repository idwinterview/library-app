# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :show_header, :show_side_nav

  protected
  def show_header
    @show_header = true
  end

  def show_side_nav
    @show_side_nav = true
  end
end
