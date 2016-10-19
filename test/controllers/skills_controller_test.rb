require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:mika)
    @teacher = users(:teacher1)
    @student = users(:student1)
    @skill = skills(:one)
  end
  
  test "should get index" do
    log_in_as(@teacher)
    get my_skills_path
    assert_response :success
  end

  test "should get new" do
    log_in_as(@teacher)
    get new_skill_path
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@teacher)
    get edit_skill_path(@skill)
    assert_response :success
  end

  test "should get delete" do
    log_in_as(@teacher)
    get delete_skill_path(@skill)
    assert_response :success
  end
end
