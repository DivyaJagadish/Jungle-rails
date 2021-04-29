class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['Admin_Login'], password:ENV['Admin_password']

  def index
    @category = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :category], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:product).permit(
      :name
    )
  end
end
