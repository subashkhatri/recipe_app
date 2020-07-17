class Recipe < ApplicationRecord
    self.per_page = 1
    belongs_to :user
    has_many :comments, dependent: :destroy, inverse_of: :recipe
    has_many :recipe_categories
    has_many :categories, through: :recipe_categories 
    
    has_many :ingredients, dependent: :destroy, inverse_of: :recipe
    accepts_nested_attributes_for :ingredients,
                                    reject_if: proc { |attributes| attributes['name'].blank? },
                                    allow_destroy: true


    
    has_many :instructions, dependent: :destroy, inverse_of: :recipe
    accepts_nested_attributes_for :instructions,
                                    reject_if: proc { |attributes| attributes['step'].blank? },
                                    allow_destroy: true



    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 3, maximum: 50 }
    validates :user_id, presence: true
    
    has_attached_file :image, styles: { medium: "400x400#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
