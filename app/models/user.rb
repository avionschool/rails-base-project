class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  before_save :uniq_stocks?

  belongs_to :role # , optional: true
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
  scope :unconfirmed, -> { where(confirmed_at: nil) }
  scope :confirmed, -> { where.not(confirmed_at: nil) }

  def admin?
    role_id == Role.find_by(name: 'Admin').id
  end

  # Put to Controller?
  def buy_stock(stock, volume, price)
    # Post a Buy Order on the APP if Buyer
    # If Broker, buy stock from IEX to sell to the APP market
    unless transaction_arg_check('Buy', stock, volume, price)
      logger.info 'Cannot proceed with transaction!'
      return false
    end

    transaction = Transaction.new(stock_id: Stock.find_by(code: stock).id, user_id: id, volume: volume, price: price, transaction_type: 'Buy')
    case role
    when Role.find_by(name: 'Broker')
      transaction.fulfilled = true
      self.cash = cash - price * volume
      stocks << Stock.find_by(code: stock) unless BuyersStock.exists?(id, Stock.find_by(code: stock).id)
    when Role.find_by(name: 'Buyer')
      self.alloted_cash = alloted_cash + price * volume
      self.cash = cash - price * volume
    end

    if cash.positive?
      ActiveRecord::Base.transaction do
        save
        transaction.save
        if role.id == Role.find_by(name: 'Broker').id
          bs = BuyersStock.find_entry(id, Stock.find_by(code: stock).id)
          bs.update(volume: bs.volume + volume)
          logger.info "Successfully added #{stock} to portfolio"
          true
        end
        logger.info 'Buy Order posted successfully.'
        true
      end
    else
      logger.info 'Something went wrong.'
      false
    end
  end

  def sell_stock(stock, volume, price)
    # Post a Sell Order on the APP
    unless transaction_arg_check('Sell', stock, volume, price)
      logger.info 'Cannot proceed with transaction!'
      false
    end
    # Check available stock in portfolio
    buyer_stock = BuyersStock.find_entry(id, Stock.find_by(code: stock).id)

    buyer_stock.alloted_volume = buyer_stock.alloted_volume + volume
    buyer_stock.volume = buyer_stock.volume - volume

    transaction = Transaction.new(stock: Stock.find_by(code: stock), user: self, volume: volume, price: price, transaction_type: 'Sell')
    if buyer_stock.volume >= volume
      ActiveRecord::Base.transaction do
        transaction.save
        buyer_stock.save
        logger.info 'Sell Order posted successfully.'
        true
      end
    else
      logger.info 'Something went wrong.'
      false
    end
  end

  # Usage: Example we have a Buy Transaction t, and a User u who wants to fulfill the order we can just call u.process_transaction(t) to fulfill the Buy Order or u.process_transaction(t, volume) to only fulfill up to certain amount. Similar to a Sell Order.
  def process_transaction(trans, volume = trans.volume)
    # Fetch Portfolio of involved parties (buyer and seller)
    return false if !transaction_arg_check(trans.transaction_type, trans.stock.code, volume, trans.price) || !oddlot?(volume, trans)

    # Check if User-Stock relation already exist, create it it does not yet exists
    stocks << trans.stock unless BuyersStock.exists?(id, trans.stock.id)
    seller_stock = BuyersStock.exists?(trans.user.id, trans.stock.id) ? BuyersStock.find_entry(id, trans.stock.id) : BuyersStock.create(user_id: trans.user.id, stock_id: trans.stock.id, volume: 0, alloted_volume: 0)
    buyer_stock = BuyersStock.find_entry(id, trans.stock.id)
    # Actual Process transaction
    return false unless process(volume, trans, buyer_stock, seller_stock)

    # Set fulfilled original transaction
    trans.fulfilled = true
    # Save and check if there is an error in updating the involved models (buyer,seller, and respective user-stock relationship)
    if save
      ActiveRecord::Base.transaction do
        buyer_stock.save
        trans.user.save
        seller_stock.save
        trans.save
        Transaction.create(user_id: id, stock_id: trans.stock_id, volume: volume, transaction_type: trans.opposite_type, fulfilled: true, price: trans.price)
        logger.info 'Successful Transaction'
        true
      end
    else
      logger.info 'Something went wrong'
      false
    end
  end

  private

  def process(volume, trans, buyer_stock, seller_stock)
    case trans.transaction_type
    when 'Sell'
      return false unless check_cash(trans.price, volume)
      self.cash = cash - (trans.price * volume)
      trans.user.cash = trans.user.cash + (trans.price * volume)
      buyer_stock.volume = buyer_stock.volume + volume
      seller_stock.alloted_volume = seller_stock.alloted_volume - volume
    when 'Buy'
      if buyer_stock.volume < volume
        logger.info 'Not enough stock'
        return false
      end
      self.cash = cash + (trans.price * volume)
      trans.user.alloted_cash = trans.user.alloted_cash - (trans.price * volume)
      buyer_stock.volume = buyer_stock.volume - volume
      seller_stock.volume = seller_stock.volume + volume
    end
    true
  end

  def oddlot?(volume, trans)
    # Check if volume inputted is processable (i.e. meets the order)
    if volume > trans.volume
      logger.info 'Invalid volume amount'
      false
    elsif volume < trans.volume
      # Create oddlot if volume is not the same as the listed volumes
      Transaction.create(user_id: trans.user_id, stock_id: trans.stock_id, price: trans.price, volume: trans.volume - volume, transaction_type: trans.transaction_type)
      trans.volume = volume
      true
    elsif volume == trans.volume
      true
    end
  end

  def check_cash(price, volume)
    return false unless cash >= (price * volume)

    true
  end

  # Ensure that an instance will be valid to save records on buyers_stocks table
  def uniq_stocks?
    self.stocks = stocks.uniq
  end

  def transaction_arg_check(type, stock, volume, price)
    return false if volume.negative? || price.negative?
    return true if %w[Buy Sell].include?(type) && !(!Stock.exists?(stock) || role == Role.find_by(name: 'Admin'))
  end

  def confirmation_required?
    role == Role.find_by(name: 'Broker')
  end
end
