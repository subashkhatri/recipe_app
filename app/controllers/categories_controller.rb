class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show edit update]
  before_action :require_admin, except: %i[index show]
  def index
    @categories = Category.paginate(page: params[:page]).order('created_At DESC')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category Successfully Added!!'
      redirect_to @category
    else
      render 'new'
      end
  end

  def show
    @category = Category.find(params[:id])
    @category_recipes = @category.recipes
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:success] = 'Category Successfully Updated!!'
      redirect_to @category
    else
      render 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end

  def require_admin
    if !user_signed_in? || (user_signed_in? && !current_user.admin?)
      flash[:danger] = 'Only admins are allowed to perform this action'
      redirect_to categories_path
    end
  end
end
