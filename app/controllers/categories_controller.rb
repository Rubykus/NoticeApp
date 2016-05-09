class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to root_path, notice: "Category created"
    else
      redirect_to root_path, notice: "Error"
    end
  end

  private

  def category_params
    params.require(:category).permit(:user_id, :name)
  end

end