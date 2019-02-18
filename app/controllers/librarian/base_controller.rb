class Librarian::BaseController < ApplicationController
  before_filter :require_admin

  def require_admin
    render file: "public/404" unless current_admin?
  end
end