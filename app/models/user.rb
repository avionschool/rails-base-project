class User < ApplicationRecord
  has_one :wallet, dependent: :destroy
  has_many :portfolios, dependent: :destroy
  has_many :transactions, dependent: :destroy

  validates :fullname, presence: true, length: { minimum: 4 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_welcome_email, :create_user_wallet

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end

  def send_welcome_email
    WelcomeMailer.welcome_account(email).deliver_now if approved == false
    WelcomeMailer.welcome_account_admin(email).deliver_now if approved == true
  end

  def create_user_wallet
    user_wallet = Wallet.new(user_id: id, balance: 100_000)
    user_wallet.save
  end
end
