# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeds for the user database. 
# Currently seeds one admin (Admin has two interviews)
#
#
# Seeds 5 completely random teachers (Each teacher has a random number of availabilities and skills)

user = User.create!(name:  "Mika",
              last_name: "Williams",
              dob: "11/09/1972",
              gender: "Other",
              email: "test@test.org",
              facebook_ID: "www.facebook.com/mika_music",
              address: "22 Queen St, Brisbane, QLD, 4000",
              password:              "password",
              password_confirmation: "password",
              teacher_qualifications: "Graduate of Drama studies and Bachelor in Arts",
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
  
  # Variables for the user table of teacher
  name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  dob = "#{Faker::Number.between(1, 30)}/#{Faker::Number.between(1, 12)}/#{Faker::Number.between(1950, 1995)}"
  isMale = Faker::Boolean.boolean
  if isMale == false
    gender = "Male"
  else
    gender = "Female"
  end
  address = "#{Faker::Address.street_address(false)}, QLD"
  email = "teacher-#{n+1}@teacher.org"
  facebook_ID = "www.facebook.com/#{name}#{last_name}"
  teacher_qualifications = "Graduated #{Faker::University.name}"
  password = "password"
  user_recieve_emails = Faker::Boolean.boolean
  teacher = true
  admin = false
  day = "" #Needed to be predefined for some reason
  
  # How many availabilities or skills does each teacher have?
  numAvailabilities = Faker::Number.between(1, 4)
  numSkills = Faker::Number.between(1, 2)
  
  # Assignment
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
               teacher: teacher,
               admin: admin)
               
  numAvailabilities.times do |a|
    # Variables for the Availability table of teacher
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
  
    Availability.create!(user_email: user.email,
                      user_id: user.id, 
                      day: day, 
                      time: time,
                      duration: duration)
  end
  
  numSkills.times do |b|
     # Variables for the Skills table of teacher
    instrumentDecider = Faker::Number.between(1, 5)
    if instrumentDecider == 1
      instrument = "Piano"
    elsif instrumentDecider == 2
     instrument = "Guitar"
    elsif instrumentDecider == 3
      instrument = "Bass"
    elsif instrumentDecider == 4
      instrument = "Claranet"
    else
      instrument = "Drums"
    end
    instrument_skill = "#{Faker::Number.between(1, 5)}.#{Faker::Number.between(1, 9)}"
    languageDecider = Faker::Number.between(1, 5)
    if languageDecider == 1
      language = "English"
    elsif languageDecider == 2
      language = "Spanish"
    elsif languageDecider == 3
      language = "French"
    elsif languageDecider == 4
      language = "Mandarin"
    else
      language = "Latin"
    end
    language_skill = "#{Faker::Number.between(1, 5)}.#{Faker::Number.between(1, 9)}"
  
    Skill.create!(user_email: user.email,
                      user_id: user.id, 
                      instrument: instrument, 
                      instrument_skill: instrument_skill,
                      language: language, 
                      language_skill: language_skill)
  end
end
               
20.times do |n|
  # Variables for the user table for students
  name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  yearOfBirth = Faker::Number.between(1980, 2010)
  dob = "#{Faker::Number.between(1, 30)}/#{Faker::Number.between(1, 12)}/#{yearOfBirth}"
  address = "#{Faker::Address.street_address(false)}, QLD"
  
  if Faker::Boolean.boolean
    facebook_ID = "www.facebook.com/#{name}#{last_name}"
  end
  
  if Faker::Boolean.boolean
    gender = "Male"
  else
    gender = "Female"
  end
  
  if yearOfBirth >= 1998
    parent_name = Faker::Name.first_name
    parent_email = "#{name}#{last_name}@parent.com"
    parent_moblie = Faker::PhoneNumber.phone_number
    parent_recieve_emails = Faker::Boolean.boolean
  else
    parent_name = "NA"
    parent_email = "NA"
    parent_moblie = "NA"
    parent_recieve_emails = false
  end
  
  user_recieve_emails = Faker::Boolean.boolean
  email = "student-#{n+1}@student.org"
  password = "password"
  teacher = false
  admin = false
  
  numFreePlayRoomSessions = Faker::Number.between(1, 4)
  numPreferences = Faker::Number.between(1, 2)
  
  #Start Assignment
  user = User.create!(name:  name,
               email: email,
               last_name: last_name,
               dob: dob,
               gender: gender,
               address: address,
               facebook_ID: facebook_ID,
               password:              password,
               password_confirmation: password,
               parent_name: parent_name,
               parent_email: parent_email,
               parent_moblie: parent_moblie,
               user_recieve_emails: user_recieve_emails,
               parent_recieve_emails: parent_recieve_emails,
               teacher: teacher,
               admin: admin)
               
  numFreePlayRoomSessions.times do |a|
    # Variables for the freePlayRoom table of students
    date = "#{Faker::Number.between(1, 30)}/#{Faker::Number.between(1, 12)}/2017"
    time = "#{Faker::Number.between(10, 20)}:#{Faker::Number.between(10, 59)}"
    duration = Faker::Number.between(1, 5)
  
    Availability.create!(user_email: user.email,
                      user_id: user.id, 
                      date: date, 
                      time: time,
                      duration: duration)
  end
  
  
end
