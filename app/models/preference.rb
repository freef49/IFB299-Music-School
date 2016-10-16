class Preference < ApplicationRecord
  belongs_to :user
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_DAY_REGEX = /[A-z]+/
  VALID_GENDER_REGEX = /[A-z]+/
  VALID_TIME_REGEX = /\A^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]/
  
  validates :user_email,  presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
  validates :preferred_day, presence: true, length: { maximum: 15 }, format: { with: VALID_DAY_REGEX }
  validates :preferred_time, presence: true, length: {maximum: 6}, format: { with: VALID_TIME_REGEX }
  validates :instrument, presence: true, length: { maximum: 30 }
  validates :preferred_teacher_language, presence: true, length: { maximum: 30 }
  validates :preferred_teacher_gender, presence: true, length: { maximum: 20}, format: { with: VALID_GENDER_REGEX }
end
