class Broker < ApplicationRecord
  has_many :broker_stocks
  has_many :stocks, through: :broker_stocks
  belongs_to :admin
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable


  def stock_already_added?(ticker_symbol, broker_id)
    stock = Stock.check_db(ticker_symbol, broker_id)
    return false unless stock
    stocks.where(id: stock.id, added_by: broker_id).exists?
  end

  def can_add_stock?(ticker_symbol, broker_id)
    !stock_already_added?(ticker_symbol, broker_id)
  end
end
