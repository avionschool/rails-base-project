def map_stocks(stocks)
  stocks = stocks.map do |stock|
    { code: stock.symbol, name: stock.name }
  end
end

client = IEX::Api::Client.new

@stocks = map_stocks(client.ref_data_symbols_for_exchange('NAS'))
Stock.create!(@stocks)
UpdateStockPrice.execute

puts "Created #{Stock.count} stocks"
puts "Updated prices of #{Stock.count} stocks"
