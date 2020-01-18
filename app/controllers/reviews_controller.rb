class ReviewsController < ApplicationController
  DB = PG.connect({:dbname => "rails_reviews_development"})

  def index
    @product = Division.find(params[:product_id])
    @reviews = @product.reviews
    render :index
  end

  def new
    @product = Division.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Division.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
    @product = Division.find(params[:product_id])
    @review = Review.find(params[:id])
    # @projects = Project.all
    render :edit
  end

  def show
    @product = Division.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def update
    @product = Division.find(params[:product_id])
    @review = Review.find(params[:id])
    # @project = Project.find(params[:project_id])
    # if @project
    #   distinct_projects = DB.exec("SELECT DISTINCT project_id FROM reviews_projects WHERE review_id = #{@review.id};")
    #   distinct = true
    #   distinct_projects.each do |distinct_project|
    #     if distinct_project.first[1].to_i == @project.id.to_i
    #       flash[:notice] = "This review is already on this project"
    #       distinct = false
    #     end
    #   end
      # if distinct == true
      #   @review.projects << @project
      # end
      redirect_to product_review_path(@product, @review)
    elsif @review.update(review_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Division.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private
  def review_params
    params.require(:review).permit(:name, :author, :content_body, :rating)
  end
end
