module TransactionsHelper
  def render_transaction(transaction)
    case transaction.transaction_type
    when 'BUY'
      "Bought #{transaction.units} units of #{transaction.market_symbol} stocks for $#{transaction.amount}."
    when 'SELL'
      "Sold #{transaction.units} units of #{transaction.market_symbol} stocks for $#{transaction.amount}."
    end
  end
end
