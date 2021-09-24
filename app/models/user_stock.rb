class UserStock < ApplicationRecord
  belongs_to :user
  validates :company_name, presence: true
  validates :ticker, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
