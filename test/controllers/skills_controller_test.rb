require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end
  
  test "should get index" do
    get my_skills_path(@user)
    assert_response :success
  end

  test "should get show" do
    get show_skill_path
    assert_response :success
  end

  test "should get new" do
    get new_skill_path(@user)
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
