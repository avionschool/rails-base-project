FactoryBot.define do
  factory :user_stock do
    average_price { 2529.23 }
    total_shares { 100 }
    user
    stock

    trait :broker do
      association :user, factory: :broker_user
    end

    trait :buyer do
      association :user, factory: :buyer_user
    end

    factory :buyer_stock, traits: [:buyer]
    factory :broker_stock, traits: [:broker]
  end
end
