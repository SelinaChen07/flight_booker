class Flight < ApplicationRecord
  belongs_to :from_airport, :class_name => "Airport"
  belongs_to :to_airport, :class_name => "Airport"
  has_many :bookings, inverse_of: :flight


  validates :from_airport_id, presence: true
  validates :to_airport_id, presence: true
  validates :flight_number, presence: true
  validates :start_time, presence: true
  validates :duration_in_minutes, presence: true

  default_scope {order(:start_time)}
end
