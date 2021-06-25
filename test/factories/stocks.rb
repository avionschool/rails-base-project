FactoryBot.define do
  factory :stock do
    ticker { 'GOOG' }
    name { 'Alphabet Inc' }
    last_price { 2529.23 }
  end
end
