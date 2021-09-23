class Stock < ApplicationRecord
  self.primary_key = 'code'
  has_many :trades, dependent: :destroy, foreign_key: 'stock_code', inverse_of: :stock
  has_many :users, through: :trades

  validates :code, presence: true
  validates :name, presence: true
  validates :current_price, presence: true, numericality: { greater_than: 0 }, on: :update

  paginates_per 10
end
