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
  { name: 'Bitcoin', kind: 'Crypto', symbol: 'BTC', slug: 'bitcoin', is_active: true },
  { name: 'Ethereum', kind: 'Crypto', symbol: 'ETH', slug: 'ethereum', is_active: true },
  { name: 'Binance Coin', kind: 'Crypto', symbol: 'BNB', slug: 'binance-coin', is_active: true },
  { name: 'Tether', kind: 'Crypto', symbol: 'USDT', slug: 'tether', is_active: true },
  { name: 'Solana', kind: 'Crypto', symbol: 'SOL', slug: 'solana', is_active: true },
  { name: 'USD Coin', kind: 'Crypto', symbol: 'USDC', slug: 'usd-coin', is_active: true },
  { name: 'Cardano', kind: 'Crypto', symbol: 'ADA', slug: 'cardano', is_active: true },
  { name: 'XRP', kind: 'Crypto', symbol: 'XRP', slug: 'xrp', is_active: true },
  { name: 'Dogecoin', kind: 'Crypto', symbol: 'DOGE', slug: 'dogecoin', is_active: true },
  { name: 'Polkadot', kind: 'Crypto', symbol: 'DOT', slug: 'polkadot-new', is_active: true },
  { name: 'Philippine Peso', kind: 'Currency', symbol: 'PHP', is_active: true }
])