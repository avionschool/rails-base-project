class Stock < ApplicationRecord
  validates :symbol, presence: true
end
