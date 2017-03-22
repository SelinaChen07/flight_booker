class FlightsController < ApplicationController
  def index
  	@airport_options =  Airport.all.map{|a|[[a.city, a.airport_code].join("  "), a.id]}

    if !params[:commit].nil?      
      if params[:from].empty? || params[:to].empty?
        flash[:danger] = "Please select both the departing airport and arriving airport."
        redirect_to flights_path
      elsif  params[:from] == params[:to]
        flash[:danger] = "Depart Airport and Arrive Airport can't be the same."
        redirect_to flights_path
      else
        @search = true
        search_date = Date.new(params[:date]["date(1i)"].to_i, params[:date]["date(2i)"].to_i, params[:date]["date(3i)"].to_i)
        @flights = Flight.where("from_airport_id = :from AND to_airport_id = :to", from: params[:from], to: params[:to]).where("start_time >= :date1 AND start_time < :date2", date1: search_date, date2:search_date+1.day)
        @passengers = params[:passengers]
        if @flights.empty?
          flash[:warning] = "There is no match flight."
          redirect_to flights_path
        end
      end  	
    end
  end

end
