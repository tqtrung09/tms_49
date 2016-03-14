# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create! name: "Example User",
  email: "example@railstutorial.org",
  password: "12345678",
  password_confirmation: "12345678",
  admin: true

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "12345678"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password
end
