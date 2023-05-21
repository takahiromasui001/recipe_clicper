class RecipeLinksController < ApplicationController
  def create
    @recipe = current_user.recipes.find(params[:recipe_id])
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
  end
end
