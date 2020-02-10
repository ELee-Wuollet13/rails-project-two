class ProductsController < ApplicationController
  scope :newest, -> { where("created_at >=?": Time.)}
  scope :most_reviewed, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(3)
    )}
  scope :american, -> { where(country: "United States || USA || America")}








  # validates :name, presence: true
  # validates_length_of :name, maximum: 100
  # validates :cost, presence: true
  # validates :country, presence: true

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
      flash[:alert] = "Sorry, that item didn't load."
      redirect_to signup_path
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
    render :show
  end


  private
  def product_params
    params.require(:product).permit(:name, :cost, :country, :id)
  end
end
