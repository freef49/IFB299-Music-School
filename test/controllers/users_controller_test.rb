# User controller test. Completes tests for two different users. One admin and the other a normal user.
# Makes sure admin has all his privliges.
# Makes sure a user can login and that index of students incriments on successful registration.
require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  test "should get new" do
    get signup_path
    assert_response :success
  end
  
  test "should redirect edit when not logged in" do
    get edit_user_path(@admin)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@admin ), params: { user: { name: @admin .name,
                                              email: @admin .email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@admin)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@student1)
    assert_no_difference 'User.count' do
      delete user_path(@admin)
    end
    assert_redirected_to root_url
  end
end
