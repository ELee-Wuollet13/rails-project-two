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
        flash[:notice] = "You've successfully signed up!"
        session[:product_id] = @product.id
        redirect_to new_question_path
      else
        flash[:alert] = "There was a problem signing up."
        redirect_to signup_path
      end
    end

    def edit
      # Code for edit album form goes here.
    end

    def show
      # Code for showing a single album goes here.
    end

    def update
      # Code for updating an album goes here.
    end

    def destroy
      # Code for deleting an album goes here.
    end
    
  private
  def product_params
    params.require(:product).permit(:cost, :reviews, :reviews, :country_of_origin)
  end
end
#
#   def index
#     @products = Product.all
#     render :index
#   end
#
#   def new
#     @product = Product.new
#         render :new
#   end
#
#   def create
#     @product = Product.new(product_params)
#     if @product.save
#       flash[:notice] = "You've successfully signed up!"
#       session[:product_id] = @product.id
#       redirect_to new_question_path
#     else
#       flash[:alert] = "There was a problem signing up."
#       redirect_to signup_path
#     end
#   end
#
#   private
#
#   def product_params
#     params.require(:product).permit(:cost, :reviews, :reviews, :country_of_origin)
#   end
# end
