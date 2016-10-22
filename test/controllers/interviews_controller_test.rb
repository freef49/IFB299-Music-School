require 'test_helper'

class InterviewsControllerTest < ActionDispatch::IntegrationTest
  
  test "admin should get index" do
    log_in_as(@admin)
    get my_interviews_path
    assert_response :success
  end
  test "admin should get new" do
    log_in_as(@admin)
    get new_interview_path
    assert_response :success
  end
  test "admin should get edit" do
    log_in_as(@admin)
    get edit_interview_path(@interview1)
    assert_response :success
  end
  test "admin should get delete" do
    log_in_as(@admin)
    get delete_interview_path(@interview1)
    assert_response :success
  end
  
  
  test "teacher should not get index" do
    log_in_as(@teacher1)
    get my_interviews_path
    assert_redirected_to root_url
  end
  test "teacher should not get new" do
    log_in_as(@teacher1)
    get new_interview_path
    assert_redirected_to root_url
  end
  test "teacher should not get edit" do
    log_in_as(@teacher1)
    get edit_interview_path(@interview1)
    assert_redirected_to root_url
  end
  test "teacher should not get delete" do
    log_in_as(@teacher1)
    get delete_interview_path(@interview1)
    assert_redirected_to root_url
  end
  
  test "student should not get index" do
    log_in_as(@student1)
    get my_interviews_path
    assert_redirected_to root_url
  end
  test "student should not get new" do
    log_in_as(@student1)
    get new_interview_path
    assert_redirected_to root_url
  end
  test "student should not get edit" do
    log_in_as(@student1)
    get edit_interview_path(@interview1)
    assert_redirected_to root_url
  end
  test "student should not get delete" do
    log_in_as(@student1)
    get delete_interview_path(@interview1)
    assert_redirected_to root_url
  end


  test "unlogged user should not get index" do
    get my_interviews_path
    assert_redirected_to login_url
  end
  test "unlogged user should not get new" do
    get new_interview_path
    assert_redirected_to login_url
  end
  test "unlogged user should not get edit" do
    get edit_interview_path(@interview1)
    assert_redirected_to login_url
  end
  test "unlogged user should not get delete" do
    get delete_interview_path(@interview1)
    assert_redirected_to login_url
  end
end
