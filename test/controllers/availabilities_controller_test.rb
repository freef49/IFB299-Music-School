require 'test_helper'

class AvailabilitiesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:mika)
    @other_user = users(:teacher1)
  end
  
  # test "should get index" do
  #   log_in_as(@user)
  #   get my_availabilities_path
  #   assert_response :success
  # end

  # test "should get show" do
  #   get availabilities_show_path
  #   assert_response :success
  # end

  # test "should get new" do
  #   get availabilities_new_path
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get availabilities_edit_path
  #   assert_response :success
  # end

  # test "should get delete" do
  #   get availabilities_delete_path
  #   assert_response :success
  # end

end
