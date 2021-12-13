json.extract! market, :id, :logo, :name, :symbol, :description, :buying_price, :selling_price, :created_at, :updated_at
json.url market_url(market, format: :json)
