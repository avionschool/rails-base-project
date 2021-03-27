FactoryBot.define do
  factory :buyer do
    first_name { 'Rio' }
    last_name { 'Sevilla' }
    email { 'rio@gmail.com' }
    password { '123456' }
    password_confirmation { '123456' }
    contact_number { '09291234567' }
    confirmed_at { Time.zone.now }
  end
end
