class RecipesController < ApplicationController
  def index
    @folder_id = params[:folder_id]
    targets =
      if @folder_id.present?
        @folder = current_user.recipe_folders.find(@folder_id)
        @folder.recipes
      else
        current_user.recipes
      end
    @q = targets.ransack(params[:q])
    @recipes = @q.result
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    image_data = RecipeScreenshot.new.build_image(@recipe.url)
    @recipe.screenshot.attach(io: StringIO.new(image_data), content_type: 'image/png', filename: "recipe_screenshot_#{@recipe.id}")
    raise unless @recipe.save!

    redirect_to recipes_path
  end

  def edit
    @recipe = current_user.recipes.find(params[:id])
  end

  def update
    @recipe = current_user.recipes.find(params[:id])

    @recipe.update!(recipe_params)

    redirect_to recipes_path
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])

    @recipe.destroy!

    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :url, :recipe_folder_id)
  end
end
