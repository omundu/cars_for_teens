class CarController < ApplicationController
  def model
    @title = "#{params[:manufacturer]} #{params[:model]}"
    
    @years = Garage.fetch_cached_garage.select{|car| car.model == params[:model]}.map(&:years).flatten
  end
  
  def year
    @title = "#{params[:manufacturer]} #{params[:model]} #{params[:year]}"
  end
end
