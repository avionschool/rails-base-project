class Food < ApplicationRecord
  validates :name, presence: true
  validates :food_group, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :nutritional_informations, dependent: :destroy
end
