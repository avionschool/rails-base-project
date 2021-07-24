FactoryBot.define do
  factory :admin do
    email { "#{first_name.gsub(' ', '')}@email.com" }
    password { 'secure123' }
    address { 'Antipolo City' }
    approved { true }
    first_name { 'admin' }
    type { 'Admin' }
  end
end
