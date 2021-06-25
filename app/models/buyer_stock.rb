class BuyerStock < ApplicationRecord
  belongs_to :buyer
  validates :companyname, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end
