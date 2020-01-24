class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = "You've successfully signed up!"
      session[:review_id] = @review.id
      redirect_to new_question_path
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to signup_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:authors, :content_body, :foreign_key)
  end
end
 
