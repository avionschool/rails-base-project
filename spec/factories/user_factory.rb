FactoryBot.define do
  factory :user do
    name { 'Test Account' }
    password { '123456' }
    email { 'test@gmail.com' }
    role_id { Role.find_by(name: 'Buyer').id }
  end
end
