# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create! name: "Tran Quang Trung",
  email: "tran.quang.trung@framgia.com",
  password: "12345678",
  password_confirmation: "12345678",
  admin: true

User.create! name: "Tran Quang Trung 1",
  email: "tqtrung09@gmail.com",
  password: "12345678",
  password_confirmation: "12345678"
