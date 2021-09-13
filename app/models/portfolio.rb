class Portfolio < ApplicationRecord
  belongs_to :trader
  has_many :stocks
end
