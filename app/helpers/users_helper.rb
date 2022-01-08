module UsersHelper
    def get_latest_stock_price(ticker)
        Stock.find_by(ticker: ticker).current_price
    end

    def profit_or_loss(holding)
        latest_stock_value = stock_total_value('no_interest', get_latest_stock_price(holding.ticker))
        pl_gross_value = holding.units + latest_stock_value
        pl_peso = holding.amount - pl_gross_value
        pl_pct = ((holding.amount - pl_gross_value) / holding.amount)
        {profit_or_loss_pct: pl_pct.round(4), profit_or_loss_peso: pl_peso.round(4), profit_or_loss_gross: pl_gross_value.round(4)}
    end

end