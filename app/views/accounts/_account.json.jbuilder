json.extract! account, :id, :img, :role, :firstname, :lastname, :address, :contact_number, :is_verified, :created_at, :updated_at
json.url account_url(account, format: :json)
