class Order < ApplicationRecord
  belongs_to :wallet
  belongs_to :coin
  before_save :pull_prices
  after_create :update_wallet

  validates :quantity, :kind, presence:true
  validate :kind_is_buy_or_sell
  validate :sufficient_balance
  
  def pull_prices
    Coin.update_price
  end

  def kind_is_buy_or_sell
    if kind == 'buy' or kind == 'sell'
      else 
        errors.add(:kind, "must be buy or sell")
    end
  end

  def sufficient_balance
    coin = Coin.find(self.coin_id)
    wallet = Wallet.find(self.wallet_id)
    if self.kind == 'buy'
      unless wallet.money >= self.quantity * coin.last_price
        errors.add(:quantity, ": insufficient balance")
      end
    elsif self.kind == 'sell'
      orders = Order.where(coin_id: self.coin_id)
      buys = orders.where(kind: 'buy').sum(:quantity)
      sells = orders.where(kind: 'sell').sum(:quantity)

      coin_bal = buys-sells

      # consolidate all coins buy and sell
      if coin_bal < self.quantity
        errors.add(:quantity, ": insufficient balance")
      end
    end
  end
  
  def update_wallet
    coin = Coin.find(self.coin_id)
    wallet = Wallet.find(self.wallet_id)
    self.price = coin.last_price
    Order.update(self.id, {
      :price => coin.last_price,
      :filled => true
    })
    if self.kind == 'buy'
      Wallet.update(self.wallet_id, 
      {
      :money=> wallet.money - self.quantity * self.price})
    elsif self.kind == 'sell'
      Wallet.update(self.wallet_id, 
      {
      :money=> wallet.money + self.quantity * self.price})
    end
  end
end