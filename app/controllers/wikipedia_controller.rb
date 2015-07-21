class WikipediaController < ApplicationController
  include WikipediaHelper
  def manufacturer
    render plain: get_manufacturer_summary
  end
  
  def model
    render plain: get_model_summary
  end
end
