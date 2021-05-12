FactoryBot.define do
  factory :note do
    title  {Faker::Lorem.word}
    association :user
  end
end