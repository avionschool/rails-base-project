class Service < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :type, presence: true, length: { maximum: 50 }
end
