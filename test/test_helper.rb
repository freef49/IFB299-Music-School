ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!


class ActiveSupport::TestCase
  fixtures :all
  include ApplicationHelper
  
  def setup
    @admin = users(:mika)
    @teacher1 = users(:teacher1)
    @teacher2 = users(:teacher2)
    @student1 = users(:student1)
    @student2 = users(:student2)
    @availability1 = availabilities(:one)
    @availability2 = availabilities(:two)
    @free_play_room1 = free_play_rooms(:one)
    @free_play_room2 = free_play_rooms(:two)
    @interview1 = interviews(:one)
    @interview2 = interviews(:two)
    @preference1 = preferences(:one)
    @preference2 = preferences(:two)
    @skill1 = skills(:one)
    @skill2 = skills(:two)
    @base_title = 'Mika Music School'
  end
  
  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end
  
  # Log in as a particular user.
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest
  # Log in as a particular user.
  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember_me: remember_me } }
  end
end
