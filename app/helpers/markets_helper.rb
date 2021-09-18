module MarketsHelper
  def current_buy_price(iex_price)
    usd_to_php = 50.06
    convert_price = iex_price * usd_to_php
    with_interest_total = convert_price + (convert_price * 0.05)
    number_to_currency(with_interest_total, unit: 'PHP ')
  end

  def current_sell_price(iex_price)
    usd_to_php = 50.06
    convert_price = iex_price * usd_to_php
    with_interest_total = convert_price - (convert_price * 0.05)
    number_to_currency(with_interest_total, unit: 'PHP ')
  end
end
