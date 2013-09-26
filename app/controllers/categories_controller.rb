class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  before_action :require_admin, only: [:new, :create, :edit, :update]
  
  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: "Category was created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category was updated successfully."
    else
      render :edit
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end