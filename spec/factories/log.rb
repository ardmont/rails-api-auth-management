FactoryBot.define do
  factory :log do
    action { Faker::Lorem.sentence(word_count: 2) }
    message { Faker::Lorem.sentence(word_count: 5) }
  end
end