class CarController < ApplicationController
  include CarHelper

  def model
    @title = "#{params[:manufacturer]} #{params[:model]}"

    @years = model_years_to_display
  end

  def year
    @title = "#{params[:manufacturer]} #{params[:model]} #{params[:year]}"
    @edmunds = Edmunds.new
    @trims = @edmunds.get_model_year_syles(params)["styles"]
  end
end
