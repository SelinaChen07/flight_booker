class Passenger < ApplicationRecord
	belongs_to :booking

	validates :booking_id, presence:true
	validates :name, presence:true
	validates :email, presence:true, uniqueness:true
end
