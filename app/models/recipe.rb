class Recipe < ApplicationRecord
  def self.search_by_title(search_term)
    return [] if search_term.blank?

    where('title LIKE ?', "%#{search_term}%").order('created_at DESC')
  end
  acts_as_punchable
  self.per_page = 6
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

  has_attached_file :image, styles: { medium: '400x400#' }
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\z}
end
