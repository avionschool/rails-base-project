class User < ApplicationRecord
  # to declare an attribute where the values maps to integers in the Role table
  enum role: { broker: 0, buyer: 1, admin: 2 }
  has_many :user_stocks, dependent: :destroy
  has_many :stocks, through: :user_stocks, dependent: :nullify
  has_many :broker_transactionrecords, class_name: 'Transactionrecord', foreign_key: 'broker_id', inverse_of: :broker, dependent: :nullify
  has_many :buyer_transactionrecords, class_name: 'Transactionrecord', foreign_key: 'buyer_id', inverse_of: :buyer, dependent: :nullify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :cash, numericality: { greater_than_or_equal_to: 0 }, if: :buyer?
  before_validation :buyer_default
  after_create :sign_up_proccess

  scope :pending_users, lambda {
    where(approved: false)
  }
  scope :approved_users, lambda {
    where(approved: true).where.not(role: 'admin')
  }
  def buyer_default
    approve_buyer
    cash_zero
  end

  def cash_zero
    self.cash = 0 if buyer?
  end

  def approve_buyer
    self.approved = true if buyer?
  end

  def sign_up_proccess
    WelcomeMailer.welcome_send(self).deliver
    AdminMailer.new_user_waiting_for_approval(email).deliver if broker?
  end

  def stock_already_tracked?(ticker_symbol)
    stock = Stock.check_db(ticker_symbol)
    return false unless stock

    stocks.exists?(id: stock.id)
  end

  def total_net_cost
    user_stocks.sum('total_shares * average_price')
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end
end
