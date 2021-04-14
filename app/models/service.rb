class Service < ApplicationRecord
  VALID_CATEGORIES = [
    'Churches',
    'Reception venues',
    'Hotels',
    'Performers',
    'Hosts',
    'Photographers',
    'Videographers',
    "Men's clothing",
    "Women's clothing",
    'Vehicles',
    'Rings',
    'Florists',
    'Lights and sounds',
    'Catering',
    'Loot bags'
  ].freeze

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true, length: { maximum: 50 }, inclusion: { in: VALID_CATEGORIES }
  before_save :downcase_fields

  belongs_to :supplier
  has_many :buyer_services, dependent: :destroy
  has_many :buyers, through: :buyer_services
  has_many :reviews, dependent: :destroy

  def downcase_fields
    category.downcase
  end
end
