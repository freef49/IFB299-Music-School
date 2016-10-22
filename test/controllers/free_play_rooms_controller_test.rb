require 'test_helper'

class FreePlayRoomsControllerTest < ActionDispatch::IntegrationTest

  test "student should get index" do
    log_in_as(@student1)
    get current_sessions_path
    assert_response :success
    assert_select "title", "Free Play Room | #{@base_title}"
  end
  test "student should get new" do
    log_in_as(@student1)
    get book_session_path
    assert_response :success
    assert_select "title", "Book Free Play Room | #{@base_title}"
  end
  test "student should get edit" do
    log_in_as(@student1)
    get edit_free_play_room_path(@free_play_room1)
    assert_response :success
    assert_select "title", "Edit Booking | #{@base_title}"
  end
  test "student should get delete" do
    log_in_as(@student1)
    get delete_free_play_room_path(@free_play_room1)
    assert_response :success
    assert_select "title", "Delete Booking | #{@base_title}"
  end
  
  
  test "teacher should get index" do
    log_in_as(@teacher1)
    get current_sessions_path
    assert_response :success
  end
  test "teacher should not get new" do
    log_in_as(@teacher1)
    get book_session_path
    assert_redirected_to root_url
  end
  test "teacher should not get edit" do
    log_in_as(@teacher1)
    get edit_free_play_room_path(@free_play_room1)
    assert_redirected_to root_url
  end
  test "teacher should not get delete" do
    log_in_as(@teacher1)
    get delete_free_play_room_path(@free_play_room1)
    assert_redirected_to root_url
  end


  test "unlogged user should not get index" do
    get current_sessions_path
    assert_redirected_to login_url
  end
  test "unlogged user should not get new" do
    get book_session_path
    assert_redirected_to login_url
  end
  test "unlogged user should not get edit" do
    get edit_free_play_room_path(@free_play_room1)
    assert_redirected_to login_url
  end
  test "unlogged user should not get delete" do
    get delete_free_play_room_path(@free_play_room1)
    assert_redirected_to login_url
  end
end
