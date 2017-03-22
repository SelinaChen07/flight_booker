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

