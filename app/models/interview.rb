class Interview < ApplicationRecord
  validate :end_before_close
  belongs_to :user
  
  VALID_USER_ID_REGEX = /[0-9]+/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_TIME_REGEX = /\A^([8-9]|0[8-9]|1[0-7]):[0|3][0]/
  VALID_DURATION_REGEX = /\A[0-9]{1}\.?[0-9]*/
  
  validates :user_id,  presence: true, format: { with: VALID_USER_ID_REGEX }
  validates :user_email,  presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
  validates :teacher_email,  presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
  validates :date, presence: true, length: { maximum: 15 }
  validates :time, presence: true, length: {maximum: 6}, format: { with: VALID_TIME_REGEX }
  validates :duration, presence: true, length: { maximum: 4 }, format: { with: VALID_DURATION_REGEX }
  
  def end_before_close
   if ((time.to_s.to_time)+(3600*duration.to_i)>("18:00".to_time))
     errors.add(:duration, "cant end after closing")
   end
  end
  
end
