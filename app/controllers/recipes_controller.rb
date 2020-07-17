class RecipesController < ApplicationController
  before_action :find_recipe, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show search]
  before_action :require_same_user, only: %i[edit update destroy]
  def index
    @recipes = Recipe.paginate(page: params[:page]).order('created_At DESC')
  end

  def new
    @recipe = current_user.recipes.build
  end

  def show
    @comment = Comment.new
    @comments = @recipe.comments
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:success] = 'Recipe Successfully Created!!'
      redirect_to @recipe

    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = 'Recipe Successfully Updated!!'
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    flash[:danger] = 'Recipe Successfully Deleted !!'
    redirect_to root_path, notice: 'Deleted successfully!'
  end

  def search
    @results = Recipe.paginate(page: params[:page]).search_by_title(params[:search_term])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: %i[id name _destroy], instructions_attributes: %i[id step _destroy], category_ids: [])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def require_same_user
    if (current_user != @recipe.user) && !current_user.admin?
      flash[:danger] = 'You can only edit or destroy your own recipe'
      redirect_to root_path
    end
  end
end
