class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update]
  def index
    @categories = Category.all.order("created_At DESC")
  end
  def new
    @category = Category.new 
  end
  def create
    @category = Category.new(category_params)
      if @category.save
            flash[:success] = "Category Successfully Added!!"
            redirect_to @category            
        else
            render 'new'
        end
  end
  def show
  end
  def edit
   
  end
  def update
    if @category.update(category_params)
      flash[:success] = "Category Successfully Updated!!"
      redirect_to @category
    else
        render 'edit'
    end
  end
  private
  def  category_params
      params.require(:category).permit(:name)
  end

  def find_category
      @category = Category.find(params[:id])
  end
end