# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Airport.create(city:"", airport_code:"", airport_name:"")
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'airports.csv'))
csv = CSV.parse(csv_text, :headers=>true)
csv.each do |row|
	a = Airport.new
	a.city = row[0].strip
	a.airport_code = row[1].strip
	a.save
end


Airport.all.each do |from_airport|
	Airport.all.each do |to_airport|
		next if from_airport.id == to_airport.id
		duration = rand(1..3)*60
		5.times do |n|
			flight_no = Faker::Code.asin
			time = 6.hours+3*n.hours
			30.times do |d|
					f = Flight.create(from_airport_id: from_airport.id, to_airport_id: to_airport.id, flight_number: flight_no, start_time:Time.zone.now.beginning_of_day+time+d.day, duration_in_minutes:duration)
			end
		end
	end
end
