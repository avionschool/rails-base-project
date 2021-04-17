json.extract! transaction, :id, :stock_id, :price, :user_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
