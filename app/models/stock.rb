class Stock < ApplicationRecord
  validates :symbol, presence: true, uniqueness: true
  validates :company_name, presence: true
end
