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
    @title = "#{params[:model]} #{params[:year]}"
  end
  
end
