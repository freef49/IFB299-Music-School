class Skill < ApplicationRecord
  belongs_to :user
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_NAME_REGEX = /[A-z]+/
  VALID_LEVEL_REGEX = /\A[0-5]{1}\.?[0-9]*/
  
  validates :user_email,  presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
  validates :instrument,  presence: true, length: { maximum: 30 }, format: { with: VALID_NAME_REGEX }
  validates :instrument_skill,  presence: true, length: { maximum: 6 }, format: { with: VALID_LEVEL_REGEX }
  validates :language, presence: true, length: { maximum: 30 }, format: { with: VALID_NAME_REGEX }
  validates :language_skill, presence: true, length: {maximum: 6}, format: { with: VALID_LEVEL_REGEX }
  
end
