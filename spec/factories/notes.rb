FactoryBot.define do
  factory :note do
    title                 {Faker::Lorem.word}
  end
end