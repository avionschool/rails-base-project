class Buyer < ApplicationRecord
  belongs_to :admin
  has_many :buyer_stocks, dependent: :destroy
  has_many :stocks, through: :buyer_stocks
  validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :timeoutable

  def stock_already_bought?(stock_id, buyer_id)
    stock = BuyerStock.check_db(stock_id, buyer_id)
    return false unless stock

    BuyerStock.exists?(stock_id: stock_id, buyer_id: buyer_id)
  end

  def can_buy_stock?(stock_id, broker_id)
    !stock_already_bought?(stock_id, broker_id)
  end
end
