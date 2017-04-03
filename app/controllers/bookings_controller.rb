class BookingsController < ApplicationController
  def new
  	@passenger_num = params[:passenger_num].to_i
  	@flight = Flight.find(params[:flight])
  	@booking = Booking.new(flight_id: params[:flight])
  	@passenger_num.times {@booking.passengers.build}
  end

  def create
    
  	@booking = Booking.new(booking_params)
  	if !@booking.save
  		@flight = Flight.find(params[:booking][:flight_id])
  		flash.now[:danger] = "Please make sure all the information in your form is correct."
  		render "new"
  	else
  		flash[:success] = "Your booking is confirmed."
  	end
  end

  private

  def booking_params
  	params.require(:booking).permit(:flight_id, passengers_attributes:[:id, :name, :email])
  end

 
end
