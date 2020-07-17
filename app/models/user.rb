class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :comments

  before_save { self.email = email.downcase }
  validates :email, presence: true, length: { maximum: 105 },
                    uniqueness: { case_sensitive: false }
end
