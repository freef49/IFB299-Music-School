require 'test_helper'

class InterviewsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:mika)
    @teacher = users(:teacher1)
    @student = users(:student1)
    @interview = interviews(:one)
  end
  
  test "should get index" do
    log_in_as(@admin)
    get my_interviews_path
    assert_response :success
  end

  test "should get new" do
    log_in_as(@admin)
    get new_interview_path
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@admin)
    get edit_interview_path(@interview)
    assert_response :success
  end

  test "should get delete" do
    log_in_as(@admin)
    get delete_interview_path(@interview)
    assert_response :success
  end

end
