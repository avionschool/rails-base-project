FactoryBot.define do
  factory :admin do
    email { 'admin@nofomo.com' }
    password { 'nofomo123' }
  end

  factory :user do
    fullname { 'example stonks' }
    email { 'user@example.com' }
    password { 'test123' }
    approved { true }
  end

  factory :pending_user, class: 'User' do
    fullname { 'pending stonks' }
    email { 'pending@example.com' }
    password { 'test123' }
    approved { false }
  end

  factory :market do
    name { 'AA' }
    current_price { 50.99 }
  end

  factory :buy_market, class: 'Portfolio' do
    user_id { 2 }
    market_symbol { 'AA' }
    hist_price { 25.95 }
    amount { 1.5 }
    market_id { 2 }
    transaction_type { 'BUY' }
    units { 0.5 }
  end

  factory :sell_market, class: 'Portfolio' do
    user_id { 2 }
    market_symbol { 'AA' }
    hist_price { 26.5 }
    amount { 1.2 }
    market_id { 2 }
    transaction_type { 'SELL' }
    units { 0.5 }
  end
end
