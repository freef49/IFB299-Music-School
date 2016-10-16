require 'test_helper'

class AvailabilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_availabilities_path
    assert_response :success
  end

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
