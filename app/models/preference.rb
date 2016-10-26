class Preference < ApplicationRecord
  belongs_to :user
  
  VALID_USER_ID_REGEX = /[0-9]+/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_DAY_REGEX = /[A-z]+/
  VALID_GENDER_REGEX = /[A-z]+/
  VALID_TIME_REGEX = /\A^([8-9]|0[8-9]|1[0-7]):[0|3][0]/
  
  validates :user_id,  presence: true, format: { with: VALID_USER_ID_REGEX }
  validates :user_email,  presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
  validates :preferred_day, presence: true, length: { maximum: 15 }, format: { with: VALID_DAY_REGEX }
  validates :preferred_time, presence: true, length: {maximum: 6}, format: { with: VALID_TIME_REGEX }
  validates :instrument, presence: true, length: { maximum: 30 }
  validates :preferred_teacher_language, presence: true, length: { maximum: 30 }
  validates :preferred_teacher_gender, presence: true, length: { maximum: 20}, format: { with: VALID_GENDER_REGEX }
end
