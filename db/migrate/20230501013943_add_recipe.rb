class AddRecipe < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes, comment: 'レシピ' do |t|
      t.string :name, null: false, comment: 'レシピ名'
      t.string :url, null: false, comment: 'レシピURL'

      t.timestamps
    end
  end
end
