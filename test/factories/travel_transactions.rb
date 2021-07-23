FactoryBot.define do
  factory :travel_transaction do
    total_price { 19_995 }
    tourist_tour
    agency
  end
end
