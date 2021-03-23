FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'email@example.com' }
    password { '123123123' }
  end
end