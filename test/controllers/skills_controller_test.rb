require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
  
  test "should get index" do
    log_in_as(@teacher1)
    get my_skills_path
    assert_response :success
    assert_select "title", "Skills | #{@base_title}"
  end
  test "should get new" do
    log_in_as(@teacher1)
    get new_skill_path
    assert_response :success
    assert_select "title", "Add Skill | #{@base_title}"
  end
  test "should get edit" do
    log_in_as(@teacher1)
    get edit_skill_path(@skill1)
    assert_response :success
    assert_select "title", "Edit Skill | #{@base_title}"
  end
  test "should get delete" do
    log_in_as(@teacher1)
    get delete_skill_path(@skill1)
    assert_response :success
    assert_select "title", "Delete Skill | #{@base_title}"
  end
  
  test "should redirect student to home page on index attempt" do
    log_in_as(@student1)
    get my_skills_path
    assert_redirected_to root_url
  end
  test "should redirect student to home page on new attempt" do
    log_in_as(@student1)
    get new_skill_path
    assert_redirected_to root_url
  end
  test "should redirect student to home page on edit attempt" do
    log_in_as(@student1)
    get edit_skill_path(@skill1)
    assert_redirected_to root_url
  end
  test "should redirect student to home page on delete attempt" do
    log_in_as(@student1)
    get delete_skill_path(@skill1)
    assert_redirected_to root_url
  end
  
  test "should redirect unlogged to login page on index attempt" do
    get my_skills_path
    assert_redirected_to login_url
  end
  test "should redirect unlogged to login page on new attempt" do
    get new_skill_path
    assert_redirected_to login_url
  end
  test "should redirect unlogged to login page on edit attempt" do
    get edit_skill_path(@skill1)
    assert_redirected_to login_url
  end
  test "should redirect unlogged to login page on delete attempt" do
    get delete_skill_path(@skill1)
    assert_redirected_to login_url
  end
end
