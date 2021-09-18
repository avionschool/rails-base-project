FactoryBot.define do
  factory :user do
    email { 'email@test.com' }
    password { 'password' }
  end

  factory :stock do
    code { 'AAPL' }
    name { 'Apple' }
    current_price { 1_000 }
  end

  factory :trade do
    user_id { 1 }
    stock_code { 'AAPL' }
    price { 1_000 }
    quantity { 100 }
    transaction_type { 'buy' }
  end
end
