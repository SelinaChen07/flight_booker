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
  		render "new"
  	else
  		flash[:success] = "Your booking is confirmed. The confirmation email was sent to passengers' email box."
      f = @booking.flight
      @booking.passengers.each{|p|
        PassengerMailer.booking_confirmation(f, p).deliver_now
      }
      redirect_to booking_path(@booking)
  	end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
  	params.require(:booking).permit(:flight_id, passengers_attributes:[:id, :name, :email])
  end

 
end
