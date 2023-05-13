class CreateRecipeFolder < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_folders do |t|
      t.string :name, null: false, comment: 'フォルダ名'

      t.timestamps
    end

    add_reference :recipes, :recipe_folder, foreign_key: true
  end
end
