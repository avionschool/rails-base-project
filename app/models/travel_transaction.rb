class TravelTransaction < ApplicationRecord
  belongs_to :tourist_tour
  belongs_to :agency
end
