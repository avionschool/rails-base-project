FactoryBot.define do
  factory :service do
    name { 'Jonels brief' }
    price { 15_000 }
    supplier_id { 1 }
    location { 'Manila' }
    category { 'Mens Clothing' }
  end
end
