require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should be invalid when flight_id is nil" do
  	assert_not Booking.create(flight_id:"").valid?
  end

  

  test "should accept nested attributes for passengers" do
#  	assert Booking.create(:flight_id=>1, :passengers=>{'0'=>{name: Kate, email: kate@jmail.com}, '1'=>{name: Hyde, email:hyde@jmail.com}}).valid?
  end

end
