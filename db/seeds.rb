# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create!(username: 'administrator',
             email: 'jamesjasper.villamor@gmail.com',
             password: 'password1234',
             password_confirmation: 'password1234',
             first_name: 'JAMES JASPER',
             last_name: 'VILLAMOR',
             role: 'admin')

User.create!(username: 'sampleuser',
             email: 'sampleuser@gmail.com',
             password: 'password1234',
             password_confirmation: 'password1234',
             first_name: 'Sample',
             last_name: 'User',
             role: 'user')

15.times do
  User.create!(username: Faker::Internet.unique.username(specifier: 5..20),
               email: Faker::Internet.unique.email,
               password: 'password1234',
               password_confirmation: 'password1234',
               first_name: Faker::Name.unique.first_name,
               last_name: Faker::Name.unique.last_name,
               role: 'user')
end

users = User.all
20.times do
  users.each do |user|
    user.students.create!(first_name: Faker::Name.unique.first_name,
                          last_name: Faker::Name.last_name,
                          middle_name: Faker::Name.middle_name,
                          address: Faker::Address.full_address,
                          birthday: Faker::Date.between(from: '1989-01-01', to: '2000-12-31'),
                          birth_place: Faker::Address.full_address,
                          gender: Faker::Gender.binary_type,
                          civil_status: 'Single',
                          email: Faker::Internet.email,
                          phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
                          fb_account: Faker::FunnyName.two_word_name,
                          course: Student.courses.sample,
                          year_level: Student.year_levels.sample,
                          religion: Faker::Religion.name,
                          father_name: Faker::Name.unique.masculine_name,
                          parent_address: Faker::Address.full_address,
                          mother_name: Faker::Name.feminine_name,
                          spouse: 'n/a',
                          att_elem: Faker::University.name,
                          att_hs: Faker::University.name,
                          att_coll: Faker::University.name)
  end
end
