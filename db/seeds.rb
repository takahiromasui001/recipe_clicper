# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Recipe.create(
  [
    { name: '豚とナスの甘辛うまみ炒め', url: 'https://tuberecipe.com/recipe/4041/detail' },
    { name: 'サムギョプサル', url: 'https://tuberecipe.com/recipe/5185/detail' },
    { name: '虚無トマトパスタ', url: 'https://pieceke.com/cooking/kyomu-tomato-pasta/' },
    { name: '至高のポテトグラタン', url: 'https://tuberecipe.com/recipe/10990/detail' },
  ],
)
