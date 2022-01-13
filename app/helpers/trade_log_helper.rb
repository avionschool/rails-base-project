module TradeLogHelper
    def trade_logger(thread)
        {date:thread.transaction_date, type:thread.transaction_type, units: thread.units, stock: thread.ticker, value_per_stock: thread.log_stock_price, total_amount: thread.amount, email: thread.email, username: thread.username}
    end
end
