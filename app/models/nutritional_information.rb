class NutritionalInformation < ApplicationRecord
  validates :label, presence: true
  validates :quantity, presence: true
  validates :unit, presence: true
  belongs_to :food
end
