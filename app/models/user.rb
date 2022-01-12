class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :wallet, dependent: :destroy
  has_many :holdings, dependent: :destroy
  has_many :trade_logs, dependent: :destroy

  after_create :create_user_wallet

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def create_user_wallet
    init_topup = Wallet.new(user_id: id, balance: 550_000)
    init_topup.save
  end
end
