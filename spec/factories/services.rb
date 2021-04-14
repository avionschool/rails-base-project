FactoryBot.define do
  factory :service do
    name { 'Jonels brief' }
    price { 15_000 }
    location { 'Manila' }
    category { "Men's clothing" }
    association :supplier
  end
end
