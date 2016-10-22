require 'test_helper'

class PreferencesControllerTest < ActionDispatch::IntegrationTest
  
  test "student should get index" do
    log_in_as(@student1)
    get my_preferences_path
    assert_response :success
    assert_select "title", "Preferences | #{@base_title}"
  end
  test "student should get new" do
    log_in_as(@student1)
    get new_preference_path
    assert_response :success
    assert_select "title", "Add Preferences | #{@base_title}"
  end
  test "student should get edit" do
    log_in_as(@student1)
    get edit_preference_path(@preference1)
    assert_response :success
    assert_select "title", "Edit Preference | #{@base_title}"
  end
  test "student should get delete" do
    log_in_as(@student1)
    get delete_preference_path(@preference1)
    assert_response :success
    assert_select "title", "Delete Preference | #{@base_title}"
  end
  
  test "teacher should not get index" do
    log_in_as(@teacher1)
    get my_preferences_path
    assert_redirected_to root_url
  end
  test "teacher should not get new" do
    log_in_as(@teacher1)
    get new_preference_path
    assert_redirected_to root_url
  end
  test "teacher should not get edit" do
    log_in_as(@teacher1)
    get edit_preference_path(@preference1)
    assert_redirected_to root_url
  end
  test "teacher should not get delete" do
    log_in_as(@teacher1)
    get delete_preference_path(@preference1)
    assert_redirected_to root_url
  end
  
  test "unlogged user should not get index" do
    get my_preferences_path
    assert_redirected_to login_url
  end
  test "unlogged user should not get new" do
    get new_preference_path
    assert_redirected_to login_url
  end
  test "unlogged user should not get edit" do
    get edit_preference_path(@preference1)
    assert_redirected_to login_url
  end
  test "unlogged user should not get delete" do
    get delete_preference_path(@preference1)
    assert_redirected_to login_url
  end
end
