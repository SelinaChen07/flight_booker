require 'test_helper'

class PassengerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should be invalid when passenger name is nil" do
  	assert_not Passenger.create(booking_id:"", name:"test", email:"test@test.com").valid?
  	assert_not Passenger.create(booking_id:1, name:"", email:"test@test.com").valid?
  	assert_not Passenger.create(booking_id:1, name:"test", email:"").valid?
  end

end
