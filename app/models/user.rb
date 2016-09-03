class User < ApplicationRecord
  before_save { self.email = email.downcase }
  
  VALID_NAME_REGEX = /[a-z]+/
  VALID_DOB_REGEX = /\A(?:0?[1-9]|[1-2]\d|3[01])\/(?:0?[1-9]|1[0-2])\/\d{4}\Z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  validates :name,  presence: true, length: { maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :last_name, presence: true, length: { maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :dob, presence: true, length: {maximum: 12}, format: { with: VALID_DOB_REGEX }
  validates :gender, length: { maximum: 10 }
  validates :facebook_ID, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

end
