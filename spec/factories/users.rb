FactoryBot.define do
  sequence :user_email do |n|
    "user_#{n}@example.com"
  end

  factory :user do
    email { FactoryBot.generate :user_email }
    name { 'Somename' }
    confirmed_at { Time.now }
    password { 'root0000' }
    password_confirmation { 'root0000' }
  end
end
