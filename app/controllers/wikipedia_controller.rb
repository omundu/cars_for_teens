class WikipediaController < ApplicationController
  include WikipediaHelper
  
  def manufacturer
    render plain: get_manufacturer_summary(params[:manufacturer])
  end
  
  def model
    render plain: get_model_summary(params[:manufacturer], params[:model])
  end

end
