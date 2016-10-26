class Availability < ApplicationRecord
  belongs_to :user
  
  VALID_USER_ID_REGEX = /[0-9]+/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_DAY_REGEX = /[A-z]+/
  VALID_TIME_REGEX = /\A^([8-9]|0[8-9]|1[0-7]):[0|3][0]/
  VALID_DURATION_REGEX = /\A[0-9]{1}\.?[0-9]*/
  VALID_DURATIONS= %w(0.50 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10)
  
  validates :user_id,  presence: true, format: { with: VALID_USER_ID_REGEX }
  validates :user_email,  presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
  validates :day, presence: true, length: { maximum: 15 }, format: { with: VALID_DAY_REGEX }
  validates :time, presence: true, length: {maximum: 5}, format: { with: VALID_TIME_REGEX }
  validates :duration, presence: true, length: { maximum: 2 }, format: { with: VALID_DURATION_REGEX }, inclusion: {in: VALID_DURATIONS}

end
