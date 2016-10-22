require 'test_helper'

class PreferencesControllerTest < ActionDispatch::IntegrationTest
  
  test "student should get index" do
    log_in_as(@student1)
    get my_preferences_path
    assert_response :success
  end
  test "student should get new" do
    log_in_as(@student1)
    get new_preference_path
    assert_response :success
  end
  test "student should get edit" do
    log_in_as(@student1)
    get edit_preference_path(@preference1)
    assert_response :success
  end
  test "student should get delete" do
    log_in_as(@student1)
    get edit_preference_path(@preference1)
    assert_response :success
  end
end
