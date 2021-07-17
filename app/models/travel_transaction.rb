class TravelTransaction < ApplicationRecord
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :tourist_tour
  belongs_to :agency
end
