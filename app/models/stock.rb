class Stock < ApplicationRecord
  require 'iex-ruby-client'
  has_and_belongs_to_many :users, join_table: 'buyers_stocks'
  has_many :transactions, dependent: :nullify

  validates :volume, numericality: { greater_than_or_equal_to: 0 }
  validates :code, uniqueness: true
  # Returns true if the stock code exists, false otherwise

  def self.exists?(code)
    !!find_by(code: code)
  end

  def self.most_active
    @client = IEX::Api::Client.new(
      publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
      secret_token: ENV['IEX_API_SECRET_TOKEN'],
      endpoint: 'https://cloud.iexapis.com/v1'
    )
    Rails.cache.fetch('active_stocks', expires_in: 12.hours) do
      @client.stock_market_list(:mostactive)
    end
  end

  def check_total
    self.volume = BuyersStock.total_stock(self)
    save
  end

  def price
    @client = IEX::Api::Client.new(
      publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
      secret_token: ENV['IEX_API_SECRET_TOKEN'],
      endpoint: 'https://cloud.iexapis.com/v1'
    )
    Rails.cache.fetch("#{cache_key_with_version}/price", expires_in: 12.hours) do
      @client.quote(code).latest_price
    end
  end
end
