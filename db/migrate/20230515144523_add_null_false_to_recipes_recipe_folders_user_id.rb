class AddNullFalseToRecipesRecipeFoldersUserId < ActiveRecord::Migration[7.0]
  def change
    change_column_null :recipes, :user_id, false
    change_column_null :recipe_folders, :user_id, false
  end
end
