class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    render :index
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.review.new
    render :new
  end

  def create
      @product = Product.find(params[:product_id])
        @review = @product.review.new(review_params)
    if @review.save

      redirect_to product_review_path(@product, @review)
    else

      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.all
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
    params.require(:review).permit(:id, :author, :content, :rating, :product_id)
  end
end
