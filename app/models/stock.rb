class Stock < ApplicationRecord
    validates :ticker, :name, presence: true
    validates :current_price, :logo_url, presence: true

    def Stock.init_api
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.config[:stocks_api_key],
            secret_token: Rails.application.credentials.config[:secret_api_key],
            endpoint: 'https://sandbox.iexapis.com/v1'
        )

        raw_list = File.open('app/assets/stock_list/blue_chips.txt')
        list = raw_list.readlines.map(&:chomp)

        
        list.each do |data|
        begin
        self.where(:ticker == data).update(current_price: client.price(data))      
        rescue
            p "none"
        end
    end
end
end
