class Recipe < ApplicationRecord
  has_one_attached :screenshot

  belongs_to :recipe_folder
end
