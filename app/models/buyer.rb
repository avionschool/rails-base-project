class Buyer < User
  has_many :buyer_stocks, dependent: :destroy
  before_create :set_default_to_true

  def set_default_to_true
    self.approved = true
  end
end
