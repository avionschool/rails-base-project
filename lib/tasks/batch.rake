namespace :batch do
  desc 'Fetching Stocks in IEX...'
  task fetch_stocks: :environment do
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex[:api_token],
      secret_token: Rails.application.credentials.iex[:secret_token],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    file = File.open('app/files/market_symbols.txt')

    file_data = file.readlines.map(&:chomp)
    logger = Logger.new(STDOUT)
    logger = Log4r::Logger.new("Application Log")
    file_data.each do |symbol|
      market = Market.find_by(name: symbol)
      logger.debug "Updating #{market.company_name}"
      market.current_price = client.price(symbol)
      market.save
    rescue StandardError
      nil
    end
  end
end
