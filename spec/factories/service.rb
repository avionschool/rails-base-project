FactoryBot.define do
  factory :service do
    name { 'Jonels brief' }
    price { 15_000 }
    location { 'Manila' }
    category { 'Mens Clothing' }
    association :supplier
  end
end
