# frozen_string_literal: true
# above line improves memory usage and speed of app
class LibrariesController < ApplicationController
  skip_before_action :show_header, only: [:show]
  skip_before_action :show_side_nav, only: [:show]
  def index
    @library = LibraryService.find_library(params)
  end

  def show
    @library = LibraryService.find_library(params)
  end
end
