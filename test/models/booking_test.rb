require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @flight = flights(:one)
    @booking = bookings(:one)
    
  end

  test "should be invalid when flight_id is nil" do
    assert_not Booking.create(flight_id:"").valid?
  end

  

  test "should accept nested attributes for passengers" do
    assert Booking.create(:flight_id=>@flight.id, passengers_attributes:[{name: "Kate", email: "kate@jmail.com"}, {name: "Hyde", email:"hyde@jmail.com"}]).valid?
#   assert Booking.create(:flight_id=>@flight.id, passengers_attributes:[{name: "Kate", email: "kate@jmail.com"}]).valid?
  end

  test "should not save if the same passenger has already booked the same flight" do
    
    assert_not Booking.create(:flight_id=>@booking.flight_id, passengers_attributes:[{name: @booking.passengers.first.name, email: @booking.passengers.first.email}]).valid?
  end
end
