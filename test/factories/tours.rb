FactoryBot.define do
  factory :tour do
    name { 'Trip to Boracay 3 days and 2 nights' }
    price { 3999 }
    location { 'Boracay' }
    duration { 3 }
    agency
  end
end
