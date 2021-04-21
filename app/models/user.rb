class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :role, foreign_key: "role_id"
  has_many :stock, class_name: "stock", foreign_key: "stock_id"

  before_save :uniq_stocks?

  belongs_to :role, optional: true
  has_and_belongs_to_many :stocks, join_table: "buyers_stocks"
  has_many :transactions, dependent: :destroy

  validates :encrypted_password, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Valid emails only!" }
  validates :cash, numericality: { greater_than_or_equal_to: 0 }
  validates :alloted_cash, numericality: { greater_than_or_equal_to: 0 }

  scope :brokers, -> { where(role: Role.find_by(name: "Broker")) }
  scope :buyers, -> { where(role: Role.find_by(name: "Buyer")) }
  scope :admins, -> { where(role: Role.find_by(name: "Admin")) }

  # Put to Controller?
   def buy_stock(stock, volume, price)
    # Post a Buy Order on the APP if Buyer
    # If Broker, buy stock from IEX to sell to the APP market
    if !(self.transaction_arg_check("buy", stock))
      p "Cannot proceed with transaction!"
      false
    end
    # Check if enough cash
    if self.cash < price * volume
      p "Not enough funds."
      false
    end

    transaction = Transaction.new(stock_id: Stock.find_by_code(stock).id, user_id: self.id, volume: volume, price: price, transaction_type: "Buy")

    if self.role.id == Role.find_by_name('Broker').id
      transaction.fulfilled = true
      self.cash = self.cash - price*volume
      self.stocks << Stock.find_by_code(stock)
    elsif self.role.id == Role.find_by_name('Buyer').id
      self.alloted_cash = self.alloted_cash + price * volume
      self.cash = self.cash - price*volume
    end


    if transaction.save and self.save
      if self.role.id == Role.find_by_name('Broker').id
        bs = BuyersStock.find_entry(self.id, Stock.find_by_code(stock).id)
        if bs.update(volume: bs.volume + volume)
          p "Successfully added #{stock} to portfolio"
          true
        end
      end
      p "Buy Order posted successfully."
      true
    else
      p "Something went wrong."
      false
    end
  end

  def sell_stock(stock, volume, price)
    # Post a Sell Order on the APP
    if !self.transaction_arg_check("sell", stock)
      p "Cannot proceed with transaction!"
      false
    end
    # Check available stock in portfolio
    buyer_stock = BuyersStock.find_entry(self.id, Stock.find_by_code(stock).id)
    if buyer_stock.volume < volume
      p "Not enough stocks to sell."
      false
    end

    buyer_stock.alloted_volume = buyer_stock.alloted_volume + volume
    buyer_stock.volume = buyer_stock.volume - volume

    transaction = Transaction.new(stock: Stock.find_by_code(stock), user: self, volume: volume, price: price, transaction_type: "Sell")

    if transaction.save && buyer_stock.save
      p "Sell Order posted successfully."
      true
    else
      p "Something went wrong."
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
      p "Invalid volume amount"
      false
    end
    # Check if User-Stock relation already exist, create it it does not yet exists
    if !BuyersStock.exists?(self.id, stock.id)
      self.stocks << stock
    end
    # Fetch Portfolio of involved parties (buyer and seller)
    buyer_stock = BuyersStock.find_entry(self.id, stock.id)
    seller_stock = BuyersStock.find_entry(other_party.id, stock.id)
    # Actual Process transaction
    if trans.transaction_type == "Sell" && self.cash >= price * volume
      self.cash = self.cash - (price * volume)
      other_party.cash = other_party.cash + (price * volume)
      buyer_stock.volume = buyer_stock.volume + volume
      seller_stock.alloted_volume = seller_stock.alloted_volume - volume
    elsif trans.transaction_type == "Buy" && buyer_stock.volume >= volume
      self.cash = self.cash + (price * volume)
      other_party.alloted_cash = other_party.alloted_cash - (price * volume)
      buyer_stock.volume = buyer_stock.volume - volume
      seller_stock.volume = seller_stock.volume + volume
    else
      p "Not enough funds/stock."
      false
    end
    # Create oddlot if volume is not the same as the listed volumes
    if volume < trans.volume
      trans.volume = trans.volume - volume
      odd_trans = Transaction.create(user: other_party, stock: stock, price: price, volume: volume, transaction_type: trans.transaction_type)
    end
    # Set fulfilled original transaction
    trans.fulfilled = true
    # Save and check if there is an error in updating the involved models (buyer,seller, and respective user-stock relationship)
    if self.save && buyer_stock.save && other_party.save && seller_stock.save && trans.save
      p "Successful Transaction"
      true
    else
      p "Something went wrong"
      false
    end
  end

  private

  # Ensure that an instance will be valid to save records on buyers_stocks table
  def uniq_stocks?
    self.stocks = self.stocks.uniq
  end

  def transaction_arg_check(type, stock)
    # Validate if user.role =  buyer/broker(?)
    # Check valid stock symbol?
    if type == "buy" || type == "sell"
      return true unless !(Stock.exists?(stock)) || self.role == Role.find_by(name: "Admin")
    end
  end
end
