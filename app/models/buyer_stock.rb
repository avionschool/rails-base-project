class BuyerStock < ApplicationRecord
  belongs_to :buyer

  validates :symbol, presence: true
  validates :company_name, presence: true
end
