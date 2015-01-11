class ManufacturerController < ApplicationController
  def index
    @title = "Manufacturers"
    @garage = CarExtractor.new
    
    @manufacturers = @garage.cars.map(&:manufacturer).uniq
  end
  
  def show
    @title = params[:manufacturer]
    @garage = CarExtractor.new
    
    @cars = @garage.cars.select{|car| car.manufacturer == params[:manufacturer]}
  end
end
