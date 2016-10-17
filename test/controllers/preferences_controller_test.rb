require 'test_helper'

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end
  
class PreferencesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get preferences_show_url
    assert_response :success
  end

  test "should get new" do
    log_in_as(@user)
    get new_preference_path
    assert_response :success
  end

  test "should get edit" do
    get preferences_edit_url
    assert_response :success
  end

end
