class Tour < ApplicationRecord
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :name, presence: true, length: { minimum: 1 }
  validates :location, presence: true, length: { minimum: 1 }
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :agency
  has_many :tourist_tours, dependent: :nullify
  has_many :tourists, through: :tourist_tours

  has_many :travel_transactions, through: :tourist_tours
  has_rich_text :details
  has_many_attached :images
end
