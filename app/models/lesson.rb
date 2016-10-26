class Lesson < ApplicationRecord
  belongs_to :user
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_DATE_REGEX = /\A(?:0?[1-9]|[1-2]\d|3[01])\/(?:0?[1-9]|1[0-2])\/\d{4}\Z/
  VALID_TIME_REGEX = /\A^([8-9]|0[8-9]|1[0-6]):[0|3][0]/

  validates :user_email,  presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
  validates :start_date, presence:true
  validates :end_date, presence:true
  validates :lesson_time, presence: true, format: { with: VALID_TIME_REGEX }
  validates :lesson_type, presence:true
   

end
