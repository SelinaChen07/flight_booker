class Booking < ApplicationRecord
	belongs_to :flight
	has_many :passengers, inverse_of: :booking, dependent: :destroy
	accepts_nested_attributes_for :passengers
end
