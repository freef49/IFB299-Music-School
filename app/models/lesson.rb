class Lesson < ApplicationRecord

  belongs_to :user
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_DATE_REGEX = /\d{2}\/\d{2}\/\d{4}/
  VALID_TIME_REGEX = /\A^([8-9]|0[8-9]|1[0-6]):[0|3][0]/

  validates :user_email,  presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
  validates :start_date, presence:true, format: { with: VALID_DATE_REGEX }
  validates :end_date, presence:true, format: { with: VALID_DATE_REGEX }
  validates :lesson_time, presence: true, format: { with: VALID_TIME_REGEX }
  validates :lesson_type, presence:true
  
  validate :not_in_past
  # validate :not_before_start
  # validate :start_while_available
  
  
  # def start_while_available
  #   
  #   if (!(time.to_s=~VALID_TIME_REGEX).nil?)
  #     if ((time.to_s.to_time)+(3600*duration.to_f)>("18:00".to_time))
  #       errors.add(:duration, "Must start during teacher availability")
  #     end
  #   end
  # end
  
  
  def not_in_past
    if (!(start_date.to_s=~VALID_DATE_REGEX).nil?)
      if (Date.parse(start_date.to_s).past?)
        errors.add(:start_date, "can not be set in the past")
      end
    end
  end
  
  
  # def not_before_start
  #   if ( (!(start_date.to_s=~VALID_DATE_REGEX).nil?) && (!(end_date.to_s=~VALID_DATE_REGEX).nil?))
  #     if (Date.parse(start_date.to_s)<Date.parse(end_date.to_s))
  #       errors.add(:end_date, "can not be before the start")
  #     end
  #   end
  # end


end
