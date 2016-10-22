require 'test_helper'

class FreePlayRoomsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    log_in_as(@student1)
    get current_sessions_path
    assert_response :success
  end
  test "should get new" do
    log_in_as(@student1)
    get book_session_path
    assert_response :success
  end
  test "should get edit" do
    log_in_as(@student1)
    get edit_free_play_room_path(@free_play_room1)
    assert_response :success
  end
  test "should get delete" do
    log_in_as(@student1)
    get delete_free_play_room_path(@free_play_room1)
    assert_response :success
  end

end
