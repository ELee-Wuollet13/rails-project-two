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
      @project= Project.find(params[:id])
      if @project.update(project_params)
        redirect_to projects_path
      else
        render :edit
      end
    end

    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to projects_path
    end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :country)
  end
end
