class RecipeLinksController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    render turbo_stream: turbo_stream.append(:recipe_links, partial: 'recipe_links/recipe_link', locals: { recipe: @recipe })
  end
end
