class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    raise unless @recipe.save!

    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :url)
  end
end
