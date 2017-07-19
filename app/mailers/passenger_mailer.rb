class PassengerMailer < ApplicationMailer

	default from: "noreply@flightbooking.com"

	def booking_confirmation(flight, passenger)
		@flight = flight
		@passenger = passenger
		mail(to: @passenger.email, subject: "Booking Confirmation")
	end
end
