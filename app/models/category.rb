class Category < ApplicationRecord
  self.per_page = 6
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name 
end