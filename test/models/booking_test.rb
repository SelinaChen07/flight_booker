require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @flight = flights(:one)
  end

  test "should be invalid when flight_id is nil" do
    assert_not Booking.create(flight_id:"").valid?
  end

  

  test "should accept nested attributes for passengers" do
    assert Booking.create(:flight_id=>@flight.id, passengers_attributes:[{name: "Kate", email: "kate@jmail.com"}, {name: "Hyde", email:"hyde@jmail.com"}]).valid?
#   assert Booking.create(:flight_id=>@flight.id, passengers_attributes:[{name: "Kate", email: "kate@jmail.com"}]).valid?
  end
end
