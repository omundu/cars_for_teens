module CarHelper
  
  def model_years_to_display
    vehicles = cars.select{|car| car.model == params[:model]}.map(&:years).flatten
    
    params[:models].nil? ? vehicles : limit_to_specified(vehicles)
  end
  
  def limit_to_specified(vehicles)
    vehicles.reject{|year| year unless params[:models].split(",").map(&:to_i).include?(year)}
  end
  
end
