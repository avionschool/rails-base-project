class Market < ApplicationRecord
  validates :market_symbol, presence: true
  validates :curr_price, presence: true
  validates :name, presence: true

  # def self.stock_list
  #     client = IEX::Api::Client.new(
  #         publishable_token: Rails.application.credentials.iex[:publishable],
  #         secret_token: Rails.application.credentials.iex[:secret],
  #         endpoint: 'https://sandbox.iexapis.com/v1'
  #     )

  #     file = File.open('app/api/stock_lists/market_symbol.txt')
  #     file_data = file.readlines.map(&:chomp)

  #     file_data.each do |data|
  #         Market.create(
  #             name: client.company(data),
  #             market_symbol: data,
  #             curr_price: client.price(data)
  #         )
  #     end
  # end
end
