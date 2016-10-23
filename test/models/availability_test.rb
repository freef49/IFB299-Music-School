require 'test_helper'

class AvailabilityTest < ActiveSupport::TestCase
  def setup
    @availability = Availability.new(user_id: "2", user_email: "teachernum1@example.gov",
                                      day: "Monday", time: "09:30", duration: "2")
  end
  
  test "Should be Valid" do
     assert @availability.valid?
  end
end
