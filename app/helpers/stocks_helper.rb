module StocksHelper
  def buy_price(current_price)
    current_price + (current_price * 0.05)
  end
  def sell_price(current_price)
    current_price - (current_price * 0.05)
  end
end
