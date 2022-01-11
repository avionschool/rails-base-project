module BackgroundServices
    class UpdateStockPrices < ApplicationService
        def update 
            @logger.info 'Initiating stock price update'

            client = IEX::Api::Client.new(
                publishable_token: Rails.application.credentials.config[:stocks_api_key],
                secret_token: Rails.application.credentials.config[:secret_api_key],
                endpoint: 'https://sandbox.iexapis.com/v1'
            )
    
            @logger.info 'Fetching tickers from text file'
            raw_list = File.open('app/assets/stock_list/blue_chips.txt')
            list = raw_list.readlines.map(&:chomp)
    
            list.each do |data|
                begin
                    Stock.where("ticker = ?", data).update(current_price: client.price(data))
                rescue => e
                    @logger.info "#{e.class} #{e.message}"
                else
                    @logger.info "#{data} stock price updated."
                end
            end
            @logger.info "Price update complete"
        end
    end
end