require 'iex-ruby-client'

def map_stocks(stocks)
  stocks = stocks.map do |stock|
    { code: stock.symbol, name: stock.name }
  end
end

client = IEX::Api::Client.new

Stock.destroy_all ##For testing only
@stocks = map_stocks(client.ref_data_symbols_for_exchange('NAS').first(10)) ##10 For testing only
Stock.create!(@stocks)

Stock.all.map do |stock|
  stock.update!(current_price: client.price('MSFT')) #MSFT for development only
  # stock.update!(current_price: client.price(stock.code))
end

puts "Created #{Stock.count} stocks"
puts "Updated current prices"