class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :wallet
  accepts_nested_attributes_for :wallet
  
  after_create :create_wallet

  def username
    return self.email.split('@')[0].capitalize
  end
  
  def admin?
    self.admin
  end

  def broker?
    return true if self.kind == "broker"
    false
  end

  private

  def create_wallet
    Wallet.create(user_id: self.id)
  end

end
