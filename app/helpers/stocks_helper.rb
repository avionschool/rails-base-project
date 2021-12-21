module StocksHelper
    def calc_value(usd_price, buy)
        usd_to_php = 50
        converted_rate = usd_price * usd_to_php
        with_interest_total = buy ? converted_rate + (converted_rate * 0.093) : converted_rate - (converted_rate * 0.093)
    end
end
