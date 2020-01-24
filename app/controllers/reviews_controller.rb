class ProductsController < ApplicationController
    def index
      @products = Product.all
      render :index
    end

    def new
      @product = Product.new
      render :new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        flash[:notice] = "You've successfully added and item!"
        # session[:product_id] = @product.id
        redirect_to new_product_path
      else
        flash[:alert] = "Sorry, that item didn't load."
        redirect_to signup_path
      end
    end

    def edit
      @product = Product.find(params[:id])
      render :edit
    end

    def show
      @review = Review.find(params[:id])
      render :show
    end

    def update
      @review= Review.find(params[:id])
      if @review.update(review_params)
        redirect_to reviews_path
      else
        render :edit
      end
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to reviews_path
    end
  private
  def product_params
    params.require(:product).permit(:cost, :reviews, :reviews, :country_of_origin)
  end
end
