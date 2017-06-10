class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @articles = Article.where('category_id = ?', @category.id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category].permit(:name))
    if @category.save
      redirect_to categories_path, notice: "Successfully created #{@category.name}"
    else
      render action: "new"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    previous_name = @category.name
    if @category.update_attributes(params[:category].permit(:name))
      redirect_to category_path(@category.id), notice: "Successfully updated #{previous_name} to #{@category.name}"
    else
      render action: "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: "Successfully deleted #{@category.name}"
  end

end
