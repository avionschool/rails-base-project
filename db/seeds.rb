# Author: github.com/rns.jey
#
# This seed file contains a list of data for 10 unique cryptocurrencies
#
# Column fields:
# @name [String] the name of the currency
# @max_supply [BigInt] the max_supply for the currency
# @symbol [String] the symbol for the crypto currency
# @slug [String] a slug for each currency formatted to work with the CoinMarketCap API (api.coinmarketcap.com)
# @is_active [Boolean] active status of an existing cryptocurrency

cryptocurrencies = Cryptocurrency.create([
  { name: 'Bitcoin', max_supply: 21000000, symbol: 'BTC', slug: 'bitcoin', is_active: true },
  { name: 'Ethereum', symbol: 'ETH', slug: 'ethereum', is_active: true },
  { name: 'Binance Coin', max_supply: 166801148, symbol: 'BNB', slug: 'binance-coin', is_active: true },
  { name: 'Tether', symbol: 'USDT', slug: 'tether', is_active: true },
  { name: 'Solana', symbol: 'SOL', slug: 'solana', is_active: true },
  { name: 'USD Coin', symbol: 'USDC', slug: 'usd-coin', is_active: true },
  { name: 'Cardano', max_supply: 45000000000, symbol: 'ADA', slug: 'cardano', is_active: true },
  { name: 'XRP', max_supply: 100000000000, symbol: 'XRP', slug: 'xrp', is_active: true },
  { name: 'Dogecoin', symbol: 'DOGE', slug: 'dogecoin', is_active: true },
  { name: 'Polkadot', symbol: 'DOT', slug: 'polkadot-new', is_active: true }
])