# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeds for the user database. 
# Currently seeds one admin, two teachers and 20 students. 

user = User.create!(name:  "Mika",
              last_name: "Williams",
              dob: "11/09/1972",
              gender: "Other",
              email: "test@test.org",
              facebook_ID: "www.facebook.com/mika_music",
              address: "22 Queen St, Brisbane, QLD, 4000",
              password:              "password",
              password_confirmation: "password",
              admin: true)

Interview.create!(user_email: user.email,
                      user_id: user.id, 
                      teacher_email: "teacher1@teacher.org", 
                      date: "12/11/2016",
                      time: "11:30",
                      duration: "2")
Interview.create!(user_email: user.email,
                      user_id: user.id, 
                      teacher_email: "teacher4@teacher.org", 
                      date: "13/11/2016",
                      time: "09:30",
                      duration: "1.5")

5.times do |n|
  name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  dob = "#{Faker::Number.between(1, 30)}/#{Faker::Number.between(1, 12)}/#{Faker::Number.between(1950, 1995)}"
  isMale = Faker::Boolean.boolean
  if isMale == false
    gender = "Male"
  else
    gender = "Female"
  end
  address = "#{Faker::Address.street_address(include_secondry = false)}, QLD"
  email = "teacher-#{n+1}@teacher.org"
  facebook_ID = "www.facebook.com/#{name}#{last_name}"
  teacher_qualifications = "Graduated #{Faker::University.name}"
  password = "password"
  user_recieve_emails = Faker::Boolean.boolean
  teacher = true
  
  dayDecider = Faker::Number.between(1, 5)
  if dayDecider == 1
    day = "Monday"
  elsif dayDecider == 2
    day = "Tuesday"
  elsif dayDecider == 3
    day = "Wednesday"
  elsif dayDecider == 4
    day = "Thursday"
  else
    day = "Friday"
  end
  time = "#{Faker::Number.between(10, 20)}:#{Faker::Number.between(10, 59)}"
  duration = Faker::Number.between(1, 5)
  
  user = User.create!(name:  name,
               last_name: last_name,
               email: email,
               address: address,
               dob: dob,
               gender: gender,
               facebook_ID: facebook_ID,
               teacher_qualifications: teacher_qualifications,
               user_recieve_emails: user_recieve_emails,
               password:              password,
               password_confirmation: password,
               teacher: teacher)
               
  2.times do |a|             
    Availability.create!(user_email: user.email,
                      user_id: user.id, 
                      day: day, 
                      time: time,
                      duration: duration)
  end
end
               
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
