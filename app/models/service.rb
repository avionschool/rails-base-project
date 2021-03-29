class Service < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true, length: { maximum: 50 }

  belongs_to :supplier
  has_many :buyer_services, dependent: :destroy
  has_many :buyers, through: :buyer_services
  has_many :reviews, dependent: :destroy
end
