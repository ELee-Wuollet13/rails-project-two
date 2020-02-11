class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    render :show
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
      @product = Product.find(params[:product_id])
        @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Your review has been saved!"
      render :show
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.all
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    @reviews = Review.all
    render :show
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to product_path(@review.product)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  end

  private
  def review_params
    params.require(:review).permit(:author, :content, :rating, :product_id)
  end
end
