class Tour < ApplicationRecord
  belongs_to :agency
  has_many :tourist_tours, dependent: :destroy
  has_many :tourists, through: :tourist_tours

  has_many :travel_transactions, through: :tourist_tours
  has_rich_text :details
  has_many_attached :images
end
