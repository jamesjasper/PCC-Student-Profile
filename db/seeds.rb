# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.create!(username: 'admin', email: 'jamesjasper.villamor@gmail.com',
             password: 'password', password_confirmation: 'password1234',
             first_name: 'James Jasper',
             last_name: 'Villamor', role: 'admin')


99.times do
  User.create!(username: Faker::Internet.unique.username,
               email: Faker::Internet.unique.email,
               password: "password1234",
               password_confirmation: "password1234",
               first_name: FAKER::Name.first_name,
               last_name: FAKER::NAME.last_name,
               role: "user")
end
