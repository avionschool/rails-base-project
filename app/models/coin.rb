require 'httparty'

class Coin < ApplicationRecord
  has_many :orders
  validate :coin_is_listed_in_binance, :target_is_usdt, :on => :create
  validates :target, uniqueness: { scope: :base }, :on => :create

  after_create :add_coingecko_id

  @coin_ids = []
  @coin_id_relation = []
  @coingecko_list = [] # contains all coins listed in gecko
  @client = CoingeckoRuby::Client.new

  def self.update_price
    @client = CoingeckoRuby::Client.new

    coingecko_ids = []
    
    coins = Coin.all
    coins.each do |coin|
      coingecko_ids << coin.coingecko_id
    end

    db_ids = []  # ready id and attribute array
    att_arr = [] # para isang committan lang sa db
    response = @client.prices(coingecko_ids, currency: 'usd', include_24hr_change: true, include_24hr_vol: true)

    response.each do |key, val|
      db_ids << Coin.find_by(coingecko_id: key).id
      att_arr << {:last_price => val["usd"], :usd_24_h => val["usd_24h_change"]}
    end
    Coin.update(db_ids, att_arr)
  end

  def self.pull_prices
    if @coin_ids.empty?
      self.coin_ids
    end
    # ids = @coin_ids.join("%2C")
    # vs_currencies = "usd"
    # url = "#{@base_uri}/simple/price?ids=#{ids}&vs_currencies=usd&include_24hr_vol=true&include_24hr_change=true"
    # response = HTTParty.get(url)

    response = @client.prices(@coin_ids, currency: 'usd', include_24hr_change: true, include_24hr_vol: true)
    


  end

  def self.coins_list
    return if @coin_ids.length == self.all.length
    # list_uri = '/coins/list'
    @coingecko_list = @client.coins_list
  end

  def self.coin_ids
    return if @coin_ids.length == self.all.length
    ids = self.coins_list
    coin_symbol = []
    self.all.each do |coin|
      coin_symbol << coin.base.downcase
    end
    @coin_ids = []
    self.coins_list.each do |coin|
      if coin_symbol.member? coin["symbol"]
        @coin_ids << coin["id"]
        @coin_id_relation << coin
      end
    end
  end

  def self.add_coingecko_id_all
    coingecko_list = self.coins_list
    mycoins_symbols = []
    Coin.all.each do |mycoin|
      if mycoin.coingecko_id.nil?
        mycoins_symbols << mycoin.base.downcase 
      end
    end
    coingecko_list.each do |gecko|
      if mycoins_symbols.member? gecko["symbol"]
        Coin.update(Coin.find_by(base: gecko["symbol"].upcase).id,
      {
        :coingecko_id => gecko["id"]
      })
      end
    end
  end

  private

  def coin_is_listed_in_binance
    # res = HTTParty.get('https://api.coingecko.com/api/v3/exchanges/binance')
    @client = CoingeckoRuby::Client.new
    res = @client.exchange('binance')

    res["tickers"].each do |coin|
      if coin["base"] == base && coin["target"] == target
        return true
      end
    end
    errors.add(:target, ": coin-pair may not be listed on binance")
  end

  def target_is_usdt
    return true if target == "USDT"
    errors.add(:target, "should be only USDT for now")
  end
  
  def add_coingecko_id
    if @coingecko_list.empty?
      self.coins_list
    end
    symbol = self.base.downcase
    @coingecko_list.each do |coin|
      return self.update_attributes!(coingecko_id: coin["id"]) if coin["symbol"] == symbol
    end
  end
  
  

end
