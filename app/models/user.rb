class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :role, foreign_key: 'role_id'

  before_save :uniq_stocks?

  belongs_to :role, optional: true
  has_and_belongs_to_many :stocks, join_table: 'buyers_stocks'
  has_many :transactions, dependent: :destroy

  validates :encrypted_password, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Valid emails only!' }
  validates :cash, numericality: { greater_than_or_equal_to: 0 }
  validates :alloted_cash, numericality: { greater_than_or_equal_to: 0 }

  scope :brokers, -> { where(role: Role.find_by(name: 'Broker')) }
  scope :buyers, -> { where(role: Role.find_by(name: 'Buyer')) }
  scope :admins, -> { where(role: Role.find_by(name: 'Admin')) }

  # Put to Controller?
  def buy_stock(stock, volume, price)
    # Post a Buy Order on the APP if Buyer
    # If Broker, buy stock from IEX to sell to the APP market
    unless transaction_arg_check('buy', stock)
      logger.info 'Cannot proceed with transaction!'
      false
    end
    # Check if enough cash
    if cash < price * volume
      logger.info 'Not enough funds.'
      false
    end

    transaction = Transaction.new(stock_id: Stock.find_by(code: stock).id, user_id: id, volume: volume, price: price, transaction_type: 'Buy')

    if role.id == Role.find_by(name: 'Broker').id
      transaction.fulfilled = true
      self.cash = cash - price * volume
      stocks << Stock.find_by(code: stock)
    elsif role.id == Role.find_by(name: 'Buyer').id
      self.alloted_cash = alloted_cash + price * volume
      self.cash = cash - price * volume
    end

    if transaction.save && save
      if role.id == Role.find_by(name: 'Broker').id
        bs = BuyersStock.find_entry(id, Stock.find_by(code: stock).id)
        if bs.update(volume: bs.volume + volume)
          logger.info "Successfully added #{stock} to portfolio"
          true
        end
      end
      logger.info 'Buy Order posted successfully.'
      true
    else
      logger.info 'Something went wrong.'
      false
    end
  end

  def sell_stock(stock, volume, price)
    # Post a Sell Order on the APP
    unless transaction_arg_check('sell', stock)
      logger.info 'Cannot proceed with transaction!'
      false
    end
    # Check available stock in portfolio
    buyer_stock = BuyersStock.find_entry(id, Stock.find_by(code: stock).id)
    if buyer_stock.volume < volume
      logger.info 'Not enough stocks to sell.'
      false
    end

    buyer_stock.alloted_volume = buyer_stock.alloted_volume + volume
    buyer_stock.volume = buyer_stock.volume - volume

    transaction = Transaction.new(stock: Stock.find_by(code: stock), user: self, volume: volume, price: price, transaction_type: 'Sell')

    if transaction.save && buyer_stock.save
      logger.info 'Sell Order posted successfully.'
      true
    else
      logger.info 'Something went wrong.'
      false
    end
  end

  # Usage: Example we have a Buy Transaction t, and a User u who wants to fulfill the order we can just call u.process_transaction(t) to fulfill the Buy Order or u.process_transaction(t, volume) to only fulfill up to certain amount. Similar to a Sell Order.
  def process_transaction(trans, volume = trans.volume)
    price = trans.price
    stock = trans.stock
    other_party = trans.user
    # Check if volume inputted is processable (i.e. meets the order)
    if volume > trans.volume
      logger.info 'Invalid volume amount'
      false
    end
    # Check if User-Stock relation already exist, create it it does not yet exists
    stocks << stock unless BuyersStock.exists?(id, stock.id)
    # Fetch Portfolio of involved parties (buyer and seller)
    buyer_stock = BuyersStock.find_entry(id, stock.id)
    seller_stock = BuyersStock.find_entry(other_party.id, stock.id)
    # Actual Process transaction
    if trans.transaction_type == 'Sell' && cash >= price * volume
      self.cash = cash - (price * volume)
      other_party.cash = other_party.cash + (price * volume)
      buyer_stock.volume = buyer_stock.volume + volume
      seller_stock.alloted_volume = seller_stock.alloted_volume - volume
    elsif trans.transaction_type == 'Buy' && buyer_stock.volume >= volume
      self.cash = cash + (price * volume)
      other_party.alloted_cash = other_party.alloted_cash - (price * volume)
      buyer_stock.volume = buyer_stock.volume - volume
      seller_stock.volume = seller_stock.volume + volume
    else
      logger.info 'Not enough funds/stock.'
      false
    end
    # Create oddlot if volume is not the same as the listed volumes
    if volume < trans.volume
      trans.volume = trans.volume - volume
      Transaction.create(user: other_party, stock: stock, price: price, volume: volume, transaction_type: trans.transaction_type)
    end
    # Set fulfilled original transaction
    trans.fulfilled = true
    # Save and check if there is an error in updating the involved models (buyer,seller, and respective user-stock relationship)
    if save && buyer_stock.save && other_party.save && seller_stock.save && trans.save
      logger.info 'Successful Transaction'
      true
    else
      logger.info 'Something went wrong'
      false
    end
  end

  private

  # Ensure that an instance will be valid to save records on buyers_stocks table
  def uniq_stocks?
    self.stocks = stocks.uniq
  end

  def transaction_arg_check(type, stock)
    # Validate if user.role =  buyer/broker(?)
    # Check valid stock symbol?
    return true if %w[buy sell].include?(type) && !(!Stock.exists?(stock) || role == Role.find_by(name: 'Admin'))
  end
end
