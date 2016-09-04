# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create!(name:  "Mika",
            last_name: "Williams",
            dob: "11/11/1111",
            gender: "Other",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  dob = "11/11/1111"
  gender = "Other"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               last_name: last_name,
               dob: dob,
               gender: gender,
               password:              password,
               password_confirmation: password)
end

10.times do |m|
  name  = Faker::Name.prefix
  last_name = Faker::Name.last_name
  dob = "11/11/1111"
  gender = "Other"
  email = "Teacher-#{m+1}@teacher.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               last_name: last_name,
               dob: dob,
               gender: gender,
               password:              password,
               password_confirmation: password,
               teacher: true)
end
