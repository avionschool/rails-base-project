class UpdateStocksPrice
  def self.execute(stocks)
    return if !stocks.first.price_updated_at.nil? && stocks.first.price_updated_at >= 5.minutes.ago

    stocks.map do |stock|
      quote(stock) { next }
    end
  end

  def self.quote(stock)
    client = IEX::Api::Client.new
    quote = client.quote(stock.code)
    if quote.latest_price.nil? || quote.latest_price.zero?
      stock.delete
      yield
    else
      stock.update!(current_price: quote.latest_price, price_updated_at: DateTime.now)
    end
  end
end
