class PagesController < ApplicationController
  def home
    @title = "Home"
    garage = CarExtractor.new
    @cars = garage.cars.sort_by{|car| [car.name, car.suggested_price]}
  end

  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
end
