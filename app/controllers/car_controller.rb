class CarController < ApplicationController
  def model
    @title = "#{params[:manufacturer]} #{params[:model]}"
    
    @years = cars.select{|car| car.model == params[:model]}.map(&:years).flatten
  end
  
  def year
    @title = "#{params[:manufacturer]} #{params[:model]} #{params[:year]}"
  end
end
