require 'test_helper'

class PassengerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @booking = bookings(:one)   
    
  end

  test "should be invalid when passenger name or email is nil" do
    assert_not @booking.passengers.create(name:"", email:"test@test.com").valid?
    assert_not @booking.passengers.create(name:"test", email:"").valid?
  end

  test "should downcase passenger's email" do
    mixed_case_email = "TeST@teST.com"
    passenger = @booking.passengers.create(name:"test", email:mixed_case_email)
    assert passenger.valid?
    assert_equal mixed_case_email.downcase, passenger.email
  end

end
