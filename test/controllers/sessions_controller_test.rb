# Test to make sure Session Controller is working.
require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end

end
