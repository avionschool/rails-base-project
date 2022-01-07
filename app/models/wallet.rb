class Wallet < ApplicationRecord
  belongs_to :user
  has_many :orders
  
  after_create :initialize_wallet
  validates :money, numericality: true;
  private

  def initialize_wallet
    Wallet.update(self.id, 
      {:wallet_address=> "0x"+SecureRandom.hex(32),
      :pnl=> 0,
      :money=> 5000}
    )
  end
end
