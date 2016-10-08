class FreePlayRoom < ApplicationRecord
  #This requires validation
  belongs_to :user
end
