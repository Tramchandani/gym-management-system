FactoryBot.define do
  factory :user do
    first_name { "First" }
    last_name { "Last" }
    email { "first@last.com" }
    dob { "01/01/2001" }
    password { "password" }
  end
end