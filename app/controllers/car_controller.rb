class CarController < ApplicationController
  include CarHelper
  
  def model
    @title = "#{params[:manufacturer]} #{params[:model]}"
    
    @years = model_years_to_display
  end
  
  def year
    @title = "#{params[:manufacturer]} #{params[:model]} #{params[:year]}"
    @safety_rating = SafetyRatings.new(params)
  end
end
