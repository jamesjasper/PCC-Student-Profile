# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

99.times do
  User.create!(username: Faker::Internet.unique.username,
               email: Faker::Internet.unique.email,
               password: "password1234",
               password_confirmation: "password1234",
               first_name: FFAKER::Name.unique.first_name,
               last_name: FFAKER::NAME.unique.last_name,
               role: "user")
end
