require 'test_helper'

class PreferenceTest < ActiveSupport::TestCase
  def setup
    @preference = Preference.new(user_id: "1", user_email: "student@example.gov", preferred_day: "Monday",
                                preferred_time: "12:30", instrument: "Guitar", 
                                preferred_teacher_language: "English", preferred_teacher_gender: "Male")
  end
  
  test "Should be Valid" do
     assert @preference.valid?
  end
  
  test "user_id should be required" do
    @preference.user_id = "     "
    assert_not @preference.valid?
  end
  test "user_email should be required" do
    @preference.user_email = "     "
    assert_not @preference.valid?
  end
  test "preferred_day should be required" do
    @preference.preferred_day = "     "
    assert_not @preference.valid?
  end
  test "preferred_time should be required" do
    @preference.preferred_time = "     "
    assert_not @preference.valid?
  end
  test "instrument should be required" do
    @preference.instrument = "     "
    assert_not @preference.valid?
  end
  test "preferred_teacher_language should be required" do
    @preference.preferred_teacher_language = "     "
    assert_not @preference.valid?
  end
  test "preferred_teacher_gender should be required" do
    @preference.preferred_teacher_gender = "     "
    assert_not @preference.valid?
  end
  
  test "user_id should be a valid number" do
    @preference.user_id = "Cat"
    assert_not @preference.valid?
  end
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @preference.user_email = invalid_address
      assert_not @preference.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "preferred_day should be string" do
    @preference.preferred_day = "401"
    assert_not @preference.valid?
  end
  test "preferred_time should be correct format" do
    @preference.preferred_time = "12/50"
    assert_not @preference.valid?
  end
  test "preferred_teacher_gender should be string" do
    @preference.preferred_teacher_gender = "1"
    assert_not @preference.valid?
  end
end
