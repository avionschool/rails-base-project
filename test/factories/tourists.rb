FactoryBot.define do
  factory :tourist do
    sequence(:email) { |n| "#{first_name.gsub(' ', '')}#{n}@email.com" }
    password { 'secure123' }
    address { 'Antipolo City' }
    approved { true }
    first_name { 'Tourist' }
    middle_name { 'New' }
    last_name { 'Gala' }
    birth_date { '2006-01-01' }
    type { 'Tourist' }
  end
end
