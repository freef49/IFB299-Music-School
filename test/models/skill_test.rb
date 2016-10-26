require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  def setup
    @skill = Skill.new(user_id: "1", user_email: "teachernum1@example.gov", instrument: "Guitar",
                        instrument_skill: "2.5", language: "English", language_skill: "4.5")
  end
  
  test "Should be Valid" do
     assert @skill.valid?
  end
  
  test "user_id should be required" do
    @skill.user_id = "     "
    assert_not @skill.valid?
  end
  test "user_email should be required" do
    @skill.user_email = "     "
    assert_not @skill.valid?
  end
  test "instrument should be required" do
    @skill.instrument = "     "
    assert_not @skill.valid?
  end
  test "instrument_skill should be required" do
    @skill.instrument_skill = "     "
    assert_not @skill.valid?
  end
  test "language should be required" do
    @skill.language = "     "
    assert_not @skill.valid?
  end
  test "language_skill should be required" do
    @skill.language_skill = "     "
    assert_not @skill.valid?
  end
  
  test "user_id should be a valid number" do
    @skill.user_id = "Cat"
    assert_not @skill.valid?
  end
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @skill.user_email = invalid_address
      assert_not @skill.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "instrument should be string" do
    @skill.instrument = "401"
    assert_not @skill.valid?
  end
  test "instrument_skill should be between 1 and 5" do
    @skill.instrument_skill = "6.5"
    assert_not @skill.valid?
  end
  test "instrument_skill should be valid between 1 and 5" do
    @skill.instrument_skill = "1.5"
    assert @skill.valid?
  end
  test "language should be string" do
    @skill.language = "401"
    assert_not @skill.valid?
  end
  test "language_skill should be between 1 and 5" do
    @skill.language_skill = "-0.5"
    assert_not @skill.valid?
  end
end
