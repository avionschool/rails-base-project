module ApplicationHelper
  def stock_value_buy(current_price)
    stock_value = current_price * 0.05
    current_price + stock_value
  end
  def stock_value_sell(current_price)
    stock_value = current_price * 0.05
    current_price - stock_value
  end
end
