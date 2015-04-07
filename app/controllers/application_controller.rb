class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def cars
    Rails.cache.fetch("garage", expires_in: 7.days) do
      CarExtractor.new.cars
    end
  end
end
