module TransactionsHelper
  def logs_format(t)
    case t.transaction_type
    when 'BUY'
      "Bought #{t.units.round(4)} units of #{t.stock_symbol} stocks at Php #{t.stock_price.round(7)} per stock for a total of Php #{t.amount.round(2)}. "
    when 'SELL'
      "Sold #{t.units} units of #{t.stock_symbol} stocks at Php #{t.stock_price.round(7)} per stock for a total of Php #{t.amount.round(2)}. "
    end
  end
end
