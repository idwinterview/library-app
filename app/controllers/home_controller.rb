class HomeController < ApplicationController
  def index
    @books = BookParser.book_feed
  end
end