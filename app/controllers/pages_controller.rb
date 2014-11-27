class PagesController < ApplicationController
  def home
    @title = "Home"
    @cars = CarExtractor.new
  end

  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
end
