class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
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
  scope :unconfirmed, -> { find_by(confirmed_at: nil) }

  # Put to Controller?
  def buy_stock(stock, volume, price)
    # Post a Buy Order on the APP if Buyer
    # If Broker, buy stock from IEX to sell to the APP market
    unless transaction_arg_check('buy', stock)
      logger.info 'Cannot proceed with transaction!'
      false
    end
    # Check if enough cash
    check_cash(price, volume)

    transaction = Transaction.new(stock_id: Stock.find_by(code: stock).id, user_id: id, volume: volume, price: price, transaction_type: 'Buy')
    case role
    when Role.find_by(name: 'Broker')
      transaction.fulfilled = true
      self.cash = cash - price * volume
      stocks << Stock.find_by(code: stock)
    when Role.find_by(name: 'Buyer')
      self.alloted_cash = alloted_cash + price * volume
      self.cash = cash - price * volume
    end
    ActiveRecord::Base.transaction do
      if cash.positive?
        save
        transaction.save
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
    ActiveRecord::Base.transaction do
      if transaction.save && buyer_stock.save
        logger.info 'Sell Order posted successfully.'
        true
      else
        logger.info 'Something went wrong.'
        false
      end
    end
  end

  # Usage: Example we have a Buy Transaction t, and a User u who wants to fulfill the order we can just call u.process_transaction(t) to fulfill the Buy Order or u.process_transaction(t, volume) to only fulfill up to certain amount. Similar to a Sell Order.
  def process_transaction(trans, volume = trans.volume)
    # Fetch Portfolio of involved parties (buyer and seller)
    buyer_stock = BuyersStock.find_entry(id, trans.stock.id)
    seller_stock = BuyersStock.find_entry(trans.user.id, trans.stock.id)
    oddlot?(volume, trans.volume) unless volume == trans.volume
    # Check if User-Stock relation already exist, create it it does not yet exists
    stocks << trans.stock # unless BuyersStock.exists?(id, trans.stock.id)
    # Actual Process transaction
    case trans.transaction_type
    when 'Sell'
      process_sell(volume, trans, buyer_stock, seller_stock)
    when 'Buy'
      process_buy(volume, trans, buyer_stock, seller_stock)
    end

    # Set fulfilled original transaction
    trans.fulfilled = true
    # Save and check if there is an error in updating the involved models (buyer,seller, and respective user-stock relationship)
    ActiveRecord::Base.transaction do
      if save
        buyer_stock.save
        trans.user.save
        seller_stock.save
        trans.save
        logger.info 'Successful Transaction'
        true
      else
        logger.info 'Something went wrong'
        false
      end
    end
  end

  private

  def process_sell(volume, trans, buyer_stock, seller_stock)
    false unless check_cash(trans.price, volume)
    self.cash = cash - (price * volume)
    trans.user.cash = trans.user.cash + (price * volume)
    buyer_stock.volume = buyer_stock.volume + volume
    seller_stock.alloted_volume = seller_stock.alloted_volume - volume
  end

  def process_buy(volume, trans, buyer_stock, seller_stock)
    if buyer_stock.volume < volume
      logger.info 'Not enough stock'
      false
    end
    self.cash = cash + (price * volume)
    trans.user.alloted_cash = trans.user.alloted_cash - (price * volume)
    buyer_stock.volume = buyer_stock.volume - volume
    seller_stock.volume = seller_stock.volume + volume
  end

  def oddlot?(volume, vol)
    # Check if volume inputted is processable (i.e. meets the order)
    if volume > vol
      logger.info 'Invalid volume amount'
      false
    elsif volume < vol
      # Create oddlot if volume is not the same as the listed volumes
      vol = volume
      Transaction.create(user: other_party, stock: stock, price: price, volume: vol - volume, transaction_type: trans.transaction_type)
    end
  end

  def check_cash(price, volume)
    return false unless cash >= price * volume
  end

  # Ensure that an instance will be valid to save records on buyers_stocks table
  def uniq_stocks?
    self.stocks = stocks.uniq
  end

  def transaction_arg_check(type, stock)
    # Validate if user.role =  buyer/broker(?)
    # Check valid stock symbol?
    return true if %w[buy sell].include?(type) && !(!Stock.exists?(stock) || role == Role.find_by(name: 'Admin'))
  end

  def confirmation_required?
    role == Role.find_by(name: 'Broker')
  end
end
