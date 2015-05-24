class ManufacturerController < ApplicationController
  def index
    @title = "Manufacturers"
    
    @manufacturers = Garage.fetch_cached_garage.map(&:manufacturer).uniq
  end
  
  def show
    @title = params[:manufacturer]
    
    @cars = Garage.fetch_cached_garage.select{|car| car.manufacturer == params[:manufacturer]}
  end
end
