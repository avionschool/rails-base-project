FactoryBot.define do
  factory :transactionrecord do
    stock_price { 2529.23 }
    quantity { 100 }
    total_price { stock_price * quantity }
    stock
    association :broker, factory: :broker_user
    association :buyer, factory: :buyer_user

    trait :add do
      transaction_type { 'add' }
    end

    trait :remove do
      transaction_type { 'remove' }
    end

    trait :buy do
      transaction_type { 'buy' }
    end

    trait :sell do
      transaction_type { 'sell' }
    end

    factory :add_transactionrecord, traits: [:add]
    factory :remove_transactionrecord, traits: [:remove]
    factory :buy_transactionrecord, traits: [:buy]
    factory :sell_transactionrecord, traits: [:sell]
  end
end
