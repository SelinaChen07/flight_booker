class Booking < ApplicationRecord
	belongs_to :flight
	has_many :passengers, inverse_of: :booking, dependent: :destroy
	accepts_nested_attributes_for :passengers

	validate :passengers_uniqueness

	private
	def passengers_uniqueness		
		self.passengers.each do |p|
			self.flight.bookings.each do |b|
				if b.passengers.find_by(email: p.email)					
					self.errors.add(:passenger, " with email address #{p.email} has already booked this flight.")			
					
				end
			end
		end
	end
end
