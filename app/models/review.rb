class Review < ApplicationRecord
  belongs_to :tourist
  belongs_to :agency
end
