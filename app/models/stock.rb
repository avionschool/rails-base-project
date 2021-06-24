class Stock < ApplicationRecord
  validates :symbol, presence: true
  validates :companyname, presence: true
end
