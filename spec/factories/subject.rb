FactoryGirl.define do
  factory :subject do
    name {Faker::Lorem.word}
    content {Faker::Lorem.sentence}
    status 0
  end
end
