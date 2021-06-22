class Buyer < User
  has_many :buyer_stocks, dependent: :destroy
  has_many :user_transactions, dependent: :destroy
  has_many :broker_stocks, through: :user_transactions

  before_create :set_default_to_true

  def set_default_to_true
    self.approved = true
  end
end
