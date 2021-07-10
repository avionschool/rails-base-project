class FoodGroup < ApplicationRecord
  validates :name, presence: true
  validates :food_name, presence: true
  has_many :food
end
