class UpdateSingleStockPrice
  def self.execute(stock)
    return if !stock.price_updated_at.nil? && stock.price_updated_at >= 5.minutes.ago

    quote(stock)
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
