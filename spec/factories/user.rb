FactoryGirl.define do
  factory :user do
    name "trung"
    password "12345678"
    password_confirmation "12345678"
    email "trung@gmail.com"
  end

  factory :admin, class: User do
    name "trung"
    password "12345678"
    password_confirmation "12345678"
    email "tran.quang.trung@framgia.com"
    admin true
  end
end
