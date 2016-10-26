require 'test_helper'

class FreePlayRoomTest < ActiveSupport::TestCase
  
  def setup
    @free_play_room = FreePlayRoom.new(user_id: "1", user_email: "student@example.gov",
                                      date: "13/12/2016", time: "09:30", duration: "2.5")
  end

  test "Should be Valid" do
     assert @free_play_room.valid?
  end
  
  test "user_id should be required" do
    @free_play_room.user_id = "     "
    assert_not @free_play_room.valid?
  end
  test "user_email should be required" do
    @free_play_room.user_email = "     "
    assert_not @free_play_room.valid?
  end
  test "date should be required" do
    @free_play_room.date = "     "
    assert_not @free_play_room.valid?
  end
  test "time should be required" do
    @free_play_room.time = "     "
    assert_not @free_play_room.valid?
  end
  test "duration should be required" do
    @free_play_room.duration = "     "
    assert_not @free_play_room.valid?
  end
  
  test "user_id should be a valid number" do
    @free_play_room.user_id = "Cat"
    assert_not @free_play_room.valid?
  end
  test "user_email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @free_play_room.user_email = invalid_address
      assert_not @free_play_room.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  test "date should be date format" do
    @free_play_room.date = "20-10-2017"
    assert_not @free_play_room.valid?
  end
  test "time should be specific format" do
    @free_play_room.time = "19/43"
    assert_not @free_play_room.valid?
  end
  test "duration should be betweeen 1 and 10" do
    @free_play_room.duration = "10.5.5"
    assert_not @free_play_room.valid?
  end
end
