FactoryBot.define do
  factory :review do
    title { 'Jonels brief' }
    rating { 5 }
    body { 'This is a test' }
    association :service
    association :buyer
  end
end
