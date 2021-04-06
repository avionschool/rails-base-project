FactoryBot.define do
  factory :supplier do
    first_name { 'Rio' }
    last_name { 'Sevilla' }
    email { Faker::Internet.email }
    password { '123456' }
    password_confirmation { '123456' }
    contact_number { '09291234567' }
    company_name { 'PayMongo' }
    approved { true }
  end
end
