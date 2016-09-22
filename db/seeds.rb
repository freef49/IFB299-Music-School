# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeds for the user database. 
# Currently seeds one admin, two teachers and 20 students. 

User.create!(name:  "Mika",
              last_name: "Williams",
              dob: "11/11/1111",
              gender: "Other",
              email: "test@test.org",
              password:              "password",
              password_confirmation: "password",
              admin: true)
             
User.create!(name:  "Mr",
               email: "teacher1@teacher.org",
               last_name: "Teacher",
               dob: "11/11/1111",
               gender: "Male",
               teacher_qualifications: "Finsished Highschool",
               password:              "password",
               password_confirmation: "password",
               teacher: true)
               
User.create!(name:  "Ms",
               email: "teacher2@teacher.org",
               last_name: "Teacher",
               dob: "11/11/1111",
               gender: "Female",
               teacher_qualifications: "Finsished Highschool",
               password:              "password",
               password_confirmation: "password",
               teacher: true)

20.times do |n|
  name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  dob = "11/11/1111"
  gender = "Other"
  email = "example-#{n+1}@student.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               last_name: last_name,
               dob: dob,
               gender: gender,
               password:              password,
               password_confirmation: password)
end
