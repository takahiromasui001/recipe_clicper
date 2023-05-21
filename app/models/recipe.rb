class Recipe < ApplicationRecord
  has_one_attached :screenshot

  belongs_to :recipe_folder, optional: true
  belongs_to :user, optional: true

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end
end
