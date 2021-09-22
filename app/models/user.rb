class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :send_welcome_email
  has_many :wallets, dependent: :destroy
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

  private

  def send_welcome_email
    WelcomeMailer.welcome_account_mailer(email).deliver_now
  end
end
