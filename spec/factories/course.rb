FactoryGirl.define do
  factory :course do
    name {Faker::Lorem.word}
    content {Faker::Lorem.sentence}
    start_date {Date.today - 2.days}
    end_date {Date.today}
    status 0
  end
end
