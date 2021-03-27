FactoryBot.define do
  factory :admin do
    first_name { "Rio" }
    last_name {"Sevilla"}
    email { "admin@gmail.com" }
    password {"123456"}
    password_confirmation {"123456"}
  end
end
