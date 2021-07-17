FactoryBot.define do
  factory :tourist_tour do
    guest_quantity { 2 }
    amount_bought { 7998 }
    start_date { '2021-07-16' }
    end_date { '2021-07-19' }
    tourist
    tour
  end
end
