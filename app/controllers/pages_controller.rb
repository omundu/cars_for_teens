class PagesController < ApplicationController
  def home
    @title = "Home"
    
    @cars = cars.sort_by{|car| [car.name, car.suggested_price]}
  end

  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
end
