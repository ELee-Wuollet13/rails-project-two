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
      redirect_to new_product_path
    else
      redirect_to new_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def most
    if Product.most_reviews.any?
      Product.most_reviews.each do |product|
        @product = product
      end
    end
    render :show
  end

  def recent
    @products = Product.three_recent
    render :recent
  end

  def america
    @products = Product.america_made
    render :america
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :country, :id)
  end
end
