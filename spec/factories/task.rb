FactoryGirl.define do
  factory :task do
    name {Faker::Lorem.word}
    content {Faker::Lorem.sentence}
  end
end
