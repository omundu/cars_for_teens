class ManufacturerController < ApplicationController
  def index
    @title = "Manufacturers"
    
    @manufacturers = cars.map(&:manufacturer).uniq
  end
  
  def show
    @title = params[:manufacturer]
    
    @cars = cars.select{|car| car.manufacturer == params[:manufacturer]}
  end
end
