class FreePlayRoom < ApplicationRecord

  #This requires validation
  belongs_to :user
  
  VALID_USER_ID_REGEX = /[0-9]+/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_DATE_REGEX = /\d{2}\/\d{2}\/\d{4}/
  VALID_TIME_REGEX =/\A^([8-9]|0[8-9]|1[0-7]):[0|3][0]/
  VALID_DURATION_REGEX = /\A[0-9]{1}\.?[0-9]*/
  
  validates :user_id,  presence: true, format: { with: VALID_USER_ID_REGEX }
  validates :user_email,  presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
  validates :date, presence: true, length: { maximum: 15 }, format: { with: VALID_DATE_REGEX }
  validates :time, presence: true, length: {maximum: 6}, format: { with: VALID_TIME_REGEX }
  validates :duration, presence: true, length: { maximum: 4 }, format: { with: VALID_DURATION_REGEX }
  
  validate :end_before_close
 validate :not_in_past
  
  def end_before_close
    if (!(time.to_s=~VALID_TIME_REGEX).nil?)
      if ((time.to_s.to_time)+(3600*duration.to_f)>("18:00".to_time))
        errors.add(:duration, "cant end after closing")
      end
    end
  end
  
  def not_in_past
    if (!(date.to_s=~VALID_DATE_REGEX).nil?)
      if (Date.parse(date.to_s).past?)
        errors.add(:date, "can not be set in the past")
      end
    end
  end
  
end
