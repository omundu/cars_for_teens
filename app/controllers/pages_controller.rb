class PagesController < ApplicationController
  def home
    @title = "Home"
    
    @cars = Garage.fetch_cached_garage.sort_by{|car| [car.name, car.suggested_price]}
  end

  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
end
