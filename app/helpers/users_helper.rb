module UsersHelper
  def user_stock_revenue(stock)
    stock_price = stock_value_sell(Stock.find_by(stock_symbol: stock.stock_symbol).current_price)
    revenue = stock.units * stock_price
    revenue.round(4)
  end

  def total_revenue(holdings)
    revenue = 0
    holdings.each do |holding|
      stock_price = stock_value_sell(Stock.find_by(stock_symbol: holding.stock_symbol).current_price)
      revenue += holding.units * stock_price
    end
    revenue.round(4)
  end
end
