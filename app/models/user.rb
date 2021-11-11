class User < ApplicationRecord
  has_many :user_stocks, dependent: :restrict_with_exception
  has_many :stocks, through: :user_stocks

  #validates :logo, :stock_symbol, :current_price, presence: true #have to make a rspec test for this
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :send_welcome_email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  # Override the following methods in approval model
  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end

  def stock_already_tracked?(stock_symbol)
    stock = Stock.check_db(stock_symbol)
    return false unless stock

    stocks.exists?(id: stock.id)
  end

  def under_stock_limit?
    stocks.count < 10
  end

  def can_track_stock?(stock_symbol)
    under_stock_limit? && !stock_already_tracked?(stock_symbol)
  end

  private

  def send_welcome_email
    WelcomeMailer.with(email: email).welcome_account_mailer.deliver_later
  end
end
