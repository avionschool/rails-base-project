class Food < ApplicationRecord
  validates :name, presence: true
  belongs_to :food_group
  belongs_to :user
  has_many :comments
  has_many :nutritional_informations
end
