require 'test_helper'

class PreferencesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:mika)
    @teacher = users(:teacher1)
    @student = users(:student1)
    @preference = preferences(:one)
  end

  test "should get index" do
    log_in_as(@student)
    get my_preferences_path
    assert_response :success
  end
  
  test "should get new" do
    log_in_as(@student)
    get new_preference_path
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@student)
    get edit_interview_path(@preference)
    assert_response :success
  end
  
  test "should get delete" do
    log_in_as(@student)
    get edit_interview_path(@preference)
    assert_response :success
  end
end
