FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email  { Faker::Internet.email }
    password { Faker::String.random }
    role { FactoryBot.create :role }
  end
end