FactoryBot.define do
  factory :user do
    name { 'Test Account' }
    password { '123456' }
    email { 'test@gmail.com' }
    role_id { 7 }
  end
end
