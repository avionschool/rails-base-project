FactoryBot.define do
  factory :trader do
    is_approved { true }
    email { 'test@email.com' }
    password { 'test12345' }
    username { 'test_123' }
    fullname { 'Testing ony' }
  end

  factory :admin do
    email { 'admin@email.com' }
    password { 'admin123' }
  end
end
