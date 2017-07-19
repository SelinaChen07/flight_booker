# README

flight-booker

This is a one-way flight booking system. 

=====================================
How to create the app.
1, Search for flights
(1) Flight Model: from_airport_id, to_airport_id, flight_number, start_time, duration
(2) Airport Model: city, airport_code(such as NYC), airport_name
(3) association:
Flight
belongs_to :from_airport, :class_name=>"Airport"
belongs_to :to_airport, :class_name=>"Airport"

Airport
has_many :departing_flights, :class_name=>"Flight", :foreign_key=>"from_airport_id"
has_many :arriving_flights, :class_name=>"Flight", :foreign_key=>"to_airport_id"

(4) Forms for search flights
From
To
Date
NO. of Passengers

(5) Considering the timezone
All the time in datebase is UTC time. To make it simple, we assume that the flight date the users choose is also UTC time.


2. Pick up a flight

3. Fill in passenger information to book in
(1) Bookings Controller: new/create/show

(2) Model Association
Consider every new booking will create the cooresponding new passengers records in db. We don't search the Passenger db to see if the same passenger exits in db before. Thus, we consider passengers db is only temporary information for bookings. Admin may destroy old booking records once a while(or may destroy the booking record when tickets are issued unless customer has logged in when makes the booking.), the corresponding passengers will be destroyed too. Thus, the association looks like below.

Booking flight_id 
belongs_to :flight
has_many :passengers, inverse_of: :booking, dependent: :destroy
accepts_nested_attributes_for :passengers

Passenger name, email
belongs_to :booking, inverse_of: :passengers

(3) Note, some other user related things are not considered here.
- In real life, USER can register an account and log in. 
- USER can save different CUSTOMERs information in their profile. Thus, next time if USERs makes a booking again, they can pick up any existing customer from their profile to save time when filling in booking form.
Thus, in real life, we could possible add USER and CUSTOMER models to save permanent passenger information.


(4) Create for a new booking
Cnosider if the passenger information the customer fills in is not correct.
eg:
- missing name
- missing email

Consider if the user double click on "Book" button. To avoid duplicate booking for the same flight, booking model should validate if the same passenger already books the same flight to ensure uniqueness.

send out booking confirmation email to passenger's email box by PassengerMailer.confirmation_email(f,p).deliver_now, we use gmail server to send the email here. Figaro gem is used to hide my gmail name and password.

(5) Show the booking information to confirm the booking



=====================================

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

