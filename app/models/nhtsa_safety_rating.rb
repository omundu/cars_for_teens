class NhtsaSafetyRating
  require 'json'
  require 'open-uri'
  
  MODEL_NAME = {
    "9-5 sedan" => "9-5",
    "C-Class sedan" => "c-class",
    "Accord sedan" => "accord",
    "Accord coupe" => "accord",
    "A3" => "a3-4-door-wagon",
    "200 sedan" => "200",
    "Tribeca/B9 Tribeca" => "tribeca",
    "A6 sedan" => "a6",
    "6" => "mazda6",
    "3-series sedan" => "3 Series",
    "Town & Country" => "Town and Country"
  }
  
  def initialize(options)
    @manufacturer = sanitize_manufacturer(options[:manufacturer])
    @model = sanitize_model(options[:model])
    @year = options[:year]
  end
  
  def sanitize_manufacturer(manufacturer)
    manufacturer.parameterize
  end
  
  def sanitize_model(model)
    correct_name = MODEL_NAME[model] || model
    correct_name.parameterize("%20")
  end
  
  def cached_ratings
    Rails.cache.fetch(["nhtsa", @manufacturer, @model, @year]) { get_ratings }
  end
  
  def get_ratings
    get_trim_information.collect{|trim_rating| trim_rating["Results"]}.flatten
  end
  
  def get_trim_information
    get_trim_ids.collect do |trim_id|
      JSON.parse(open(ratings_uri(trim_id)).read)
    end
  end
  
  def get_trim_ids
    get_trims["Results"].map{|trim| trim["VehicleId"]}
  end
  
  def get_trims
    JSON.parse(open(trim_uri).read)
  end
  
  
  def trim_uri
    "http://www.nhtsa.gov/webapi/api/SafetyRatings/modelyear/#{@year}/make/#{@manufacturer}/model/#{@model}?format=json"
  end
  
  def ratings_uri(vehicle_id)
    "http://www.nhtsa.gov/webapi/api/SafetyRatings/VehicleId/#{vehicle_id}?format=json"
  end
  
end
