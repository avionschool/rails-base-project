FactoryBot.define do
  factory :agency do
    email { "#{agency_name.gsub(' ', '')}#{rand(1..100)}@email.com" }
    password { 'secure123' }
    address { 'Antipolo City' }
    agency_name { 'Tourist Travel Tours' }
    type { 'Agency' }
    contact_number { '9307176311' }
    average_rating { 5 }

    trait :approved do
      approved { true }
    end

    factory :approved_agency, traits: [:approved]
  end
end
