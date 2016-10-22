require 'test_helper'

class AvailabilitiesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:mika)
    @teacher = users(:teacher1)
    @student = users(:student1)
    @availability = availabilities(:one)
  end
  
  test "should get index" do
    log_in_as(@teacher)
    get my_availabilities_path
    assert_response :success
  end

  test "should get new" do
    log_in_as(@teacher)
    get new_availability_path
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@teacher)
    get edit_availability_path(@availability)
    assert_response :success
  end

  test "should get delete" do
    log_in_as(@teacher)
    get delete_availability_path(@availability)
    assert_response :success
  end
  
  test "should redirect student to home page" do
    log_in_as(@student)
    get my_availabilities_path
    assert_redirected_to root_url
  end
  
  test "should redirect unlogged in user to home page" do
    get my_availabilities_path
    assert_redirected_to root_url
  end
end