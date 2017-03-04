class CategoriesController < ApplicationController
  @@colors = ['default', 'primary', 'success', 'info', 'warning', 'danger']
  before_action :authenticate_user!

  def index
    @categories = Category.order(name: :asc).all
    @colors = @@colors
  end

  def show
    @category = Category.find(params[:id])
    @lines = @category.lines
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfuly saved."
    else
      flash[:error] = "Something went wrong : " + @category.errors.full_messages.to_sentence
    end
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
    @colors = @@colors
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Successfuly saved."
    else
      flash[:error] = "Something went wrong : " + @category.errors.full_messages.to_sentence
    end
    redirect_to categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.lines.count != 0
      flash[:error] = "Cannot delete category : used in inventory."
    else
      if @category.destroy
        flash[:notice] = "Deleted!"
      else
        flash[:error] = "Something went wrong : " + @category.errors.full_messages.to_sentence
      end
    end
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :color)
  end
end
