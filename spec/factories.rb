FactoryBot.define do
  factory :user do
    email { 'email@test.com' }
    password { 'password' }
  end

  factory :stock do
    code { 'AAPL' }
    name { 'Apple' }
    current_price { 1_000 }
    price_updated_at { DateTime.now }
  end

  factory :trade do
    stock_code { 'AAPL' }
    price { 1_000 }
    quantity { 100 }
    transaction_type { 'buy' }
    total_price { 100_000 }
    association :user
  end

  factory :wallet do
    running_balance { 1_000_000 }
    association :user
  end

  factory :user_stock do
    stock_code { 'AAPL' }
    quantity { 1_000 }
    association :user
  end
end
