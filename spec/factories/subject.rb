FactoryGirl.define do
  factory :subject do
    name {Faker::Lorem.word}
    content {Faker::Lorem.sentence}
  end
end
