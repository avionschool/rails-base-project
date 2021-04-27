FactoryBot.define do 
    factory :user do

        trait(:buyer) { role_id {1} }
        trait(:broker) { role_id {2} }

        firstname { "person" }
        lastname { "example" }

        sequence :email do |n|
        "person#{n}@example.com"
        end

        password {'123456'}
        
        confirmed_at { DateTime.now }
    end
end