module SeedsServices
  class UpdateStockData < ApplicationService
    def call
      @logger.info 'Processing Market seed file'
      # initialize api client
      client = IEX::Api::Client.new(
        publishable_token: Rails.application.credentials.iex_global_api[:publishable],
        secret_token: Rails.application.credentials.iex_global_api[:secret],
        endpoint: 'https://sandbox.iexapis.com/v1'
      )

      Market.destroy_all

      @logger.info 'Fetching data from text file'
      # open text file for list of available markets in API
      file = File.open('app/api/stock_lists/market_symbol.txt')
      file_data = file.readlines.map(&:chomp)

      @logger.info 'Fetching data from API...'
      # Loop through each market to update data
      file_data.each do |data|
        Market.create(name: client.company(data).company_name, market_symbol: data, curr_price: client.price(data) * 52.25)
        @logger.info "#{data} market data updated."
      end
      @logger.info 'Fetching data from API completed'
    end
  end
end
