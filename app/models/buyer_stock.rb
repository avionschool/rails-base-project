class BuyerStock < ApplicationRecord
  validates :user_id, :ticker, :company, :quantity, :price, presence: true

  belongs_to :user

  before_save :compute_total_price_create
  # before_update :compute_total_price_update

  def self.find_db(user_id, ticker)
    find_by(user_id: user_id, ticker: ticker)
  end

  # def compute_total_price_update
  #   self.total_price += (quantity * price)
  # end

  def compute_total_price_create
    self.total_price = 0
    self.total_price = (quantity * price).round(2)
  end
end
