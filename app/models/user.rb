class User < ApplicationRecord
  attr_accessor :remember_token
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
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
  
end
