require 'test_helper'

class InterviewTest < ActiveSupport::TestCase
  def setup
    @interview = Interview.new(user_id: "1", user_email: "mika@music.com", teacher_email: "teachernum1@example.gov",
                              date: "16/10/2016", time: "10:30", duration: "2")
  end
  
  test "Should be Valid" do
     assert @interview.valid?
  end
  
  test "user_id should be required" do
    @interview.user_id = "     "
    assert_not @interview.valid?
  end
  test "user_email should be required" do
    @interview.user_email = "     "
    assert_not @interview.valid?
  end
  test "teacher_email should be required" do
    @interview.teacher_email = "     "
    assert_not @interview.valid?
  end
  test "date should be required" do
    @interview.date = "     "
    assert_not @interview.valid?
  end
  test "time should be required" do
    @interview.time = "     "
    assert_not @interview.valid?
  end
  test "duration should be required" do
    @interview.duration = "     "
    assert_not @interview.valid?
  end
  
  test "user_id should be a valid number" do
    @interview.user_id = "Cat"
    assert_not @interview.valid?
  end
  test "user_email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @interview.user_email = invalid_address
      assert_not @interview.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  test "teacher_email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @interview.teacher_email = invalid_address
      assert_not @interview.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  test "date should be date format" do
    @interview.date = "20-10-2017"
    assert_not @interview.valid?
  end
  test "time should be specific format" do
    @interview.time = "19/43"
    assert_not @interview.valid?
  end
  test "duration should be betweeen 1 and 10" do
    @interview.duration = "10.5.5"
    assert_not @interview.valid?
  end
end
