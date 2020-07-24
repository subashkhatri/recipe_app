class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])

    @comment = @recipe.comments.create(comment_params)
    redirect_to @recipe if @comment.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:danger] = 'Recipe Successfully Deleted !!'
    redirect_to @recipe
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end
end
