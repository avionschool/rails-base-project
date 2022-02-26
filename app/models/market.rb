class Market < ApplicationRecord
  def self.fetch_stocks
    # PLEASE DONT USE THIS. THIS IS JUST FOR TESTING. JUST SEED USING rails db:seed
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex[:api_token],
      secret_token: Rails.application.credentials.iex[:secret_token],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )

    file = File.open('app/files/market_symbols.txt')

    file_data = file.readlines.map(&:chomp)

    file_data.each do |symbol|
      create(name: symbol, current_price: client.price(symbol))

    rescue StandardError
      nil
    end
  end
end
