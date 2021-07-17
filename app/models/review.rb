class Review < ApplicationRecord
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :tourist
  belongs_to :agency
end
