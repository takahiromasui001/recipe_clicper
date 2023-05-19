class RecipeLinksController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
  end
end
