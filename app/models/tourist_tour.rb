class TouristTour < ApplicationRecord
  validates :guest_quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :amount_bought, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :tour
  belongs_to :tourist

  has_one :travel_transaction, dependent: :nullify
end
