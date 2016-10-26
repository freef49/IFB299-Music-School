require 'test_helper'

class AvailabilityTest < ActiveSupport::TestCase
  def setup
    @availability = Availability.new(user_id: "2", user_email: "teachernum1@example.gov",
                                      day: "Monday", time: "09:30", duration: "2")
  end
  
  test "Should be Valid" do
     assert @availability.valid?
  end
  
  test "user_id should be required" do
    @availability.user_id = "     "
    assert_not @availability.valid?
  end
  test "user_email should be required" do
    @availability.user_email = "     "
    assert_not @availability.valid?
  end
  test "day should be required" do
    @availability.day = "     "
    assert_not @availability.valid?
  end
  test "time should be required" do
    @availability.time = "     "
    assert_not @availability.valid?
  end
  test "duration should be required" do
    @availability.duration = "     "
    assert_not @availability.valid?
  end
  
  test "user_id should be a valid number" do
    @availability.user_id = "Cat"
    assert_not @availability.valid?
  end
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @availability.user_email = invalid_address
      assert_not @availability.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  test "day should be string" do
    @availability.day = "401"
    assert_not @availability.valid?
  end
  test "time should be specific format" do
    @availability.time = "19/43"
    assert_not @availability.valid?
  end
  test "duration should be betweeen 1 and 10" do
    @availability.duration = "12.5"
    assert_not @availability.valid?
  end
end
