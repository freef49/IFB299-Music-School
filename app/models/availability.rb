class Availability < ApplicationRecord
  #This requires validation
  belongs_to :user
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_DAY_REGEX = /[A-z]+/
  VALID_TIME_REGEX = /\A^([8-9]|0[8-9]|1[0-7]):[0|3][0]/
  VALID_DURATION_REGEX = /\A[0-9]{1}\.?[0-9]*/
  
  #VALID_START_TIMES= %w(8:00 8:30 9:00 9:30 10:00 10:30 11:00 11:30 12:00 12:30 13:00 13:30 14:00 14:30 15:00 15:30 16:00 16:30 17:00 17:30)
  VALID_DURATIONS= %w(0.50 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10)
  
  validates :user_email,  presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
  validates :day, presence: true, length: { maximum: 15 }, format: { with: VALID_DAY_REGEX }
  validates :time, presence: true, length: {maximum: 6}, format: { with: VALID_TIME_REGEX },  message: "%{value} is not a valid start time."  
  validates :duration, presence: true, length: { maximum: 4 }, format: { with: VALID_DURATION_REGEX }, inclusion: {in: VALID_DURATIONS}, if: ()
  
end
