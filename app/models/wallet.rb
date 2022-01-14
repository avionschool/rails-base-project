class Wallet < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :portfolios
  
  after_create :initialize_wallet
  # validates :money, numericality: true;
  private

  def initialize_wallet
    Wallet.update(self.id, 
      {:wallet_address=> "0x"+SecureRandom.hex(20),
      :pnl=> 0,
      :money=> 5000}
    )
  end
end
