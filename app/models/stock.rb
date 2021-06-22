class Stock < ApplicationRecord
  validates :symbol, presence: true
  validates :company_name, presence: true
end
