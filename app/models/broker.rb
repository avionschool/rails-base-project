class Broker < ApplicationRecord
  has_many :broker_stocks
  has_many :stocks, through: :broker_stocks
  belongs_to :admin
  validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :timeoutable
  
  def stock_already_added?(ticker_symbol)
    stock = Stock.check_db(ticker_symbol)
    return false unless stock
    stocks.where(id: stock.id).exists?
  end

  def can_add_stock?(ticker_symbol)
    !stock_already_added?(ticker_symbol)
  end
end
