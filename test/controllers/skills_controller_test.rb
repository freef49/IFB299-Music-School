require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:mika)
    @other_user = users(:teacher1)
  end
  
  test "should get index" do
    log_in_as(@user)
    get my_skills_path
    assert_response :success
  end

  test "should get show" do
    get show_skill_path
    assert_response :success
  end

  test "should get new" do
    log_in_as(@user)
    get new_skill
    assert_response :success
  end

  test "should get edit" do
    get edit_skill_path
    assert_response :success
  end

  test "should get delete" do
    get delete_skill_path
    assert_response :success
  end

end
