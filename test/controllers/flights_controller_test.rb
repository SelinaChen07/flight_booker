require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @from_airport = airports(:syd)
    @to_airport = airports(:bne)
    @flight = flights(:one)
  end
  
  test "should get index only for flight search" do
    get flights_url
    assert_response :success
    assert_match "Search", response.body
    assert_select "h2", text:"Pick up a flight", count:0
  end

  test "should redirect back to index for flight search when departing airport is empty" do
  	get flights_url(:from=>"", :to=>@to_airport.id, :commit=>"Search")
  	assert_not flash.empty?
  	assert_redirected_to flights_url
  end

  test "should redirect back to index for flight search when arriving airport is empty" do
    get flights_url(:from=>@from_airport.id, :to=>"", :commit=>"Search")
    assert_not flash.empty?
    assert_redirected_to flights_url
  end

  test "should redirect back to index for flight search when departing airport is the same as arriving airport" do
    get flights_url(:from=>@from_airport.id, :to=>@from_airport.id, :commit=>"Search")
    assert_not flash.empty?
    assert_redirected_to flights_url
  end

  test "should redirect back to index for flight search when there is no match flight" do
    get flights_url(:from=>@from_airport.id, :to=>@to_airport.id, "date[date(1i)]"=>2000, "date[date(2i)]"=>1, "date[date(3i)]"=>01, :passengers=>1, :commit=>"Search")
    assert_not flash.empty?
    assert_redirected_to flights_url
  end

  test "should return the search result" do
    get flights_url(:from=>@from_airport.id, :to=>@to_airport.id, "date[date(1i)]"=>@flight.start_time.year, "date[date(2i)]"=>@flight.start_time.month, "date[date(3i)]"=>@flight.start_time.day, :passengers=>1, :commit=>"Search")
    assert flash.empty?
    assert_match "Pick up a flight", response.body
    assert_select "table", count:2
  end

end
