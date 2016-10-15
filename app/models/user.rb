class User < ApplicationRecord
  
  #Relationships
  has_one :skill
  has_many :preferences
  has_many :lessons
  has_many :interviews
  has_many :free_play_rooms
  has_many :availabilities
  
  
  attr_accessor :remember_token, :activation_token, :reset_token
  #Before saving, convert email to lower case. This will save many problems.
  before_save { self.email = email.downcase }
  
  #Current REGEX's used for user registration. May need to add regex for facebookID. 
  #This is too be discussed with the client team.
  
  VALID_NAME_REGEX = /[a-z]+/
  VALID_PARENT_REGEX = /[a-z]*/
  VALID_DOB_REGEX = /\A(?:0?[1-9]|[1-2]\d|3[01])\/(?:0?[1-9]|1[0-2])\/\d{4}\Z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  validates :name,  presence: true, length: { maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :last_name, presence: true, length: { maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :dob, presence: true, length: {maximum: 12}, format: { with: VALID_DOB_REGEX }
  validates :gender, presence: true, length: { maximum: 10 }
  validates :facebook_ID, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
  has_secure_password
  #Password has no regex at current stage. Only needs to be longer than 6 characters. 
  #Too discuss with client team.
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  #validates :parent_name, length: { maximum: 50 }, format: { with: VALID_PARENT_REGEX }
  #validates :parent_email, length: { maximum: 100 }
                    
  validates :teacher_qualifications, length: { maximum: 255 }

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
  
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def m_admin
    update_attribute(:admin, true)
  end
  
  def teacher?
    if self.teacher.nil?
      return false
    elsif self.teacher == false
      return false
    else
      return true
    end
  end
  
  def admin?
    if self.admin.nil?
      return false
    else
      return true
    end
  end
  
    # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

    # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
  
end
