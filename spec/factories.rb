FactoryBot.define do
  factory :admin do
    email { 'admin@nofomo.com' }
    password { 'nofomo123' }
  end

  factory :user do
    fullname { 'example stonks' }
    email { 'user@example.com' }
    password { 'test123' }
    approved { true }
  end

  factory :pending_user, class: 'User' do
    fullname { 'pending stonks' }
    email { 'pending@example.com' }
    password { 'test123' }
    approved { false }
  end
end
