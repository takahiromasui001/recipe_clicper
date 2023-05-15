class AddUserReferenceToRecipesAndRecipeFolders < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :user, foreign_key: true
    add_reference :recipe_folders, :user, foreign_key: true
  end
end
