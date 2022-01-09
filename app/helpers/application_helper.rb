module ApplicationHelper
    def stock_total_value(bool, stock_latest_price)
        php_value = stock_latest_price * 51
        value_added = stock_latest_price * 0.1
        case bool
        when true 
            php_value + value_added
        when false
            php_value - value_added
        when 'no_interest'
            php_value
        end
    end

    def to_PHP(value)
        number_to_currency(value, unit: 'PHP ')
    end
end
