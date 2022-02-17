class MainController < ApplicationController
  skip_before_action :show_header, :show_side_nav, only: [:index]
  def index
    @library = LibraryService.find_library('00')
  end
end
