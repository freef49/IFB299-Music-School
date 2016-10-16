require 'test_helper'

class InterviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_interviews_path
    assert_response :success
  end

  # test "should get show" do
  #   get interviews_show_path
  #   assert_response :success
  # end

  test "should get new" do
    get new_interview_path
    assert_response :success
  end

  # test "should get edit" do
  #   get interviews_edit_url
  #   assert_response :success
  # end

  # test "should get delete" do
  #   get interviews_delete_url
  #   assert_response :success
  # end

end
