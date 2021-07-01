FactoryBot.define do
  factory :user do
    username { 'user' }
    email { "#{username}@email.com" }
    password { 'secure123' }
    approved { true }
    cash { 0 }

    trait :admin do
      username { 'admin' }
      role { 'admin' }
    end

    trait :buyer do
      username { 'buyer' }
      role { 'buyer' }
    end

    trait :broker do
      username { 'broker' }
      role { 'broker' }
    end

    factory :admin_user, traits: [:admin]
    factory :buyer_user, traits: [:buyer]
    factory :broker_user, traits: [:broker]
  end
end
