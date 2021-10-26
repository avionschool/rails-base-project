require 'pry'

FactoryBot.define do
  factory :confirmed_user, class: 'User' do
    sequence(:email) { |e| "dummy_user+#{e}@abc.com" }
    sequence(:password) { |pw| "abc12345#{pw}" }
    sequence(:full_name) { |fn| "abc_user#{fn}" }
    sequence(:username) { |un| "abctech_#{un}" }
    sequence(:company) { |comp| "ABC Tech Corporation #{comp}" }
    confirmed_at { Time.zone.today }
    # after(:build) { |user| user.class.skip_callback(:after_create) }
  end

  factory :admin do
    email { 'abc.dev@tech.com' }
    password { 'test1234' }
    username { 'abcdev' }
  end

  factory :mainbook_entries, class: 'MainBook' do
    date_mainb { DateTime.now }
    mainbook_description { 'Payment for something' }
    or_vat_reg_tin_mainb { 'tin12345' }
    debit_mainb { rand(100..5000) }
    credit_mainb { rand(100..5000) }
    balance_mainb { rand(100..5000) }
  end

  factory :create_minibook, class: 'MiniBook' do
    user_id { rand(1..100) }
    minibook_name { 'Client Avion' }
  end

  factory :minibook_entries, class: 'MinibookEntry' do
    date_minib_entry { DateTime.now }
    minibook_entry_description { 'Electronics stuff' }
    or_vat_reg_tin_minib { 'tin12345' }
    debit_minib { rand(100..5000) }
    credit_minib { rand(100..5000) }
    minibook_balance { rand(100..5000) }
  end
end
