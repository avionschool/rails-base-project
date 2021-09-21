class UpdateStockPrice
  def self.execute
    client = IEX::Api::Client.new
    Stock.all.map do |stock|
      quote = client.quote(stock.code)
      if quote.latest_price.nil? || quote.latest_price.zero?
        stock.delete
        next
      end
    rescue IEX::Errors::ClientError
      retry
    else
      stock.update!(current_price: quote.latest_price)
    end
  end
end
