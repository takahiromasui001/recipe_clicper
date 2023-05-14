class RecipesController < ApplicationController
  def index
    @folder_id = params[:folder_id]
    @recipes =
      if @folder_id.present?
        @folder = RecipeFolder.find(@folder_id)
        @folder.recipes
      else
        Recipe.all
      end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    image_data = RecipeScreenshot.new.build_image(@recipe.url)
    @recipe.screenshot.attach(io: StringIO.new(image_data), content_type: 'image/png', filename: "recipe_screenshot_#{@recipe.id}")
    raise unless @recipe.save!

    redirect_to recipes_path
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.update!(recipe_params)

    redirect_to recipes_path
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.destroy!

    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :url, :recipe_folder_id)
  end
end
