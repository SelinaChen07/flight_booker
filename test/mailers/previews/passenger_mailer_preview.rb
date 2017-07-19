# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview

	def booking_confirmation
		booking = Booking.first
		f = booking.flight
		p = booking.passengers.first
		PassengerMailer.booking_confirmation(f, p)
	end

end
