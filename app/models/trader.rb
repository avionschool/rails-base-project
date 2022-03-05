class Trader < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :wallet, dependent: :destroy
  has_many :BalanceRequests, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :fullname, presence: true
  validates :username, presence: true
  after_create :send_email, :create_wallet
  def active_for_authentication?
    super && is_approved?
  end

  def inactive_message
    is_approved? ? super : :not_approved
  end

  def send_email
    if is_approved?
      UserMailer.welcome_email(email).deliver_now
    else
      UserMailer.registration(email).deliver_now
    end
  end

  def create_wallet
    Wallet.create(balance: 5000, trader_id: id)
  end
end
