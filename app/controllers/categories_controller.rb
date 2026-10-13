class CategoriesController < ApplicationController
  
  def index
    @title = "Categories"
    
    @categories = cars.map(&:category).uniq
  end
  
  def show
    @title = params[:category]
    
    @cars = cars.select{|car| car.category == params[:category]}
  end
  
  def model
    @title = params[:model]
    
    @years = cars.select{|car| car.name == params[:model]}.map(&:years).flatten
  end
  
  def year
    if params[:model].match(%r{(#{WIKIPEDIA_NAMES.keys.join('|')}) (.+)}i)
      manufacturer = $1
      model = $2
    else
      manufacturer, *model = params[:model].split
      model = model.join(" ")
    end
    
    @title = "#{params[:model]} #{params[:year]}"
    @safety_rating = SafetyRatings.new({manufacturer: manufacturer, model: model, year: params[:year]})
    @nhtsa_safety_rating = NhtsaSafetyRating.new({manufacturer: manufacturer, model: model, year: params[:year]})
  end
  
end
