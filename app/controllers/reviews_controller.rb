class ReviewsController < ApplicationController
  def create
    @review = Review.new(params[:review])
    @review.book_id = params[:book_id]
    @review.save
    redirect_to book_path(@review.book)
  end
end