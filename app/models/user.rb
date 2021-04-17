class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :uniq_stocks?

  belongs_to :role
  has_and_belongs_to_many :stocks, join_table: "buyers_stocks"
  has_many :transactions

  validates :encrypted_password, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP, message:"Valid emails only!" }
  validates :cash, numericality: {greater_than_or_equal_to: 0}
  validates :alloted_cash, numericality: {greater_than_or_equal_to: 0}


  scope :brokers, -> {where(role: Role.find_by(name: 'Broker'))} 
  scope :buyers, -> {where(role: Role.find_by(name: 'Buyer'))} 
  scope :admins, -> {where(role: Role.find_by(name: 'Admin'))} 

  # Put to Controller?
  def buy_stock(stock,volume,price)
    # Post a Buy Order on the APP
    if !(self.transaction_arg_check('buy',stock))
      'Cannot proceed with transaction!'
    end
    # Check if enough cash
    if self.cash < price*volume
      'Not enough funds.'
    end
    
    transaction = Transaction.new(stock_id: Stock.find_by_code(stock).id, user_id: self.id, volume: volume, price: price, transaction_type: 'Buy')

    self.alloted_cash = price*volume
    self.cash = self.cash - self.alloted_cash

    if transaction.save and self.save
      "Buy Order posted successfully."
    else
      "Something went wrong."
    end

  end

  def sell_stock(stock,volume,price)
    # Post a Sell Order on the APP
    if !self.transaction_arg_check('sell',stock)
      'Cannot proceed with transaction!'
    end
    # Check available stock in portfolio
    buyer_stock = BuyersStock.find_entry(self.id, Stock.find_by_code(stock).id)
    if buyer_stock.volume < volume
      "Not enough stocks to sell."
    end

    buyer_stock.alloted_volume = volume
    buyer_stock.volume = buyer_stock.volume - buyer_stock.alloted_volume

    transaction = Transaction.new(stock: Stock.find_by_code(stock), user: self, volume: volume, price: price, transaction_type: 'Sell')

    if transaction.save && buyer_stock.save
      "Sell Order posted successfully."
    else
      "Something went wrong."
    end

  end

  def process_transaction(trans)

    price = trans.price
    volume = trans.volume
    stock = trans.stock
    other_party = trans.user

    if !BuyersStock.exists?(self.id, stock.id)
      self.stocks << stock
    end

    buyer_stock = BuyersStock.find_entry(self.id, stock.id)
    seller_stock = BuyersStock.find_endtry(other_party.id, stock.id)

    if trans.transaction_type == 'Sell' && self.cash > price*volume
      self.cash = self.cash - (price*volume)
      other_party.cash = other_party.cash + (price*volume)

      buyer_stock.volume = buyer_stock.volume + volume
      seller_stock.alloted_volume = seller_stock.alloted_volume - volume
    elsif trans.transaction_type == 'Buy' && buyer_stock.volume > volume
      self.cash = self.cash + (price*volume)
      other_party.alloted_cash = other_party.alloted_cash - (price*volume)

      buyer_stock.volume = buyer_stock.volume - volume
      seller_stock.volume = seller_stock.volume + volume
    else
      "Not enough funds/stock."
    end

    if self.save and buyer_stock.save and other_party.save and seller_stock.save
      "Successful Transaction"
    else
      "Something went wrong"
    end
  end


  private
  # Ensure that an instance will be valid to save records on buyers_stocks table
  def uniq_stocks?
    self.stocks = self.stocks.uniq
  end

  def transaction_arg_check(type,stock)
    # Validate if user.role =  buyer/broker(?)
    # Check valid stock symbol?
    if type == 'buy' || type == 'sell'
      return true unless !(Stock.exists?(stock)) || self.role == Role.find_by(name: 'Admin')
    end
  end

end
