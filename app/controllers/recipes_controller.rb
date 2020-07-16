class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def index
        @recipes = Recipe.all.order("created_At DESC")
    end

    def new
        @recipe = current_user.recipes.build
    end
    
    def show
    end

    def create
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
            flash[:success] = "Recipe Successfully Created!!"
            redirect_to @recipe
            
        else
            render 'new'
        end
    end
    
    def edit
    end

    def update
        if @recipe.update(recipe_params)
            flash[:success] = "Recipe Successfully Updated!!"
            redirect_to @recipe
        else
            render 'edit'
        end
    end

    def destroy
        @recipe.destroy
        flash[:danger] = "Recipe Successfully Deleted !!"
        redirect_to root_path, notice: "Deleted successfully!"
    end

    private
    def  recipe_params
        params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], instructions_attributes: [:id, :step, :_destroy], category_ids: [])
    end

    def find_recipe
        @recipe = Recipe.find(params[:id])
    end

    def require_same_user
        if current_user != @recipe.user and !current_user.admin?
            flash[:danger] = "You can only edit or destroy your own recipe"
            redirect_to root_path
        end
    end
end
