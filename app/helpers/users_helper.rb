module UsersHelper

  def get_current_value(portfolio)
    market = Market.find_by(name: portfolio.market_symbol)
    return market.current_price * portfolio.units
  end
end
