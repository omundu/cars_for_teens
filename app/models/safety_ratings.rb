class SafetyRatings
  require 'open-uri'
  
  MODEL_NAME = {
    "9-5 sedan" => "9-5",
    "C-Class sedan" => "c-class",
    "Accord sedan" => "accord-4-door-sedan",
    "Accord coupe" => "accord-2-door-coupe",
    "A3" => "a3-4-door-wagon",
    "200 sedan" => "200-4-door-sedan",
    "Tribeca/B9 Tribeca" => "tribeca",
    "A6 sedan" => "a6",
    "3-series sedan" => "3-series-4-door-sedan",
    "9-3" => "9-3-4-door-sedan"
  }

  def initialize(options)
    @manufacturer = sanitize_manufacturer(options[:manufacturer])
    @model = sanitize_model(options[:model])
    @year = options[:year]
  end
  
  def cached_ratings
    Rails.cache.fetch(["iihs", @manufacturer, @model, @year]) { ratings }
  end

  def ratings
    ratings_section.collect do |rating|
      {
        rating_type: rating.at_css('.rating-caption').content.strip,
        rating_value: rating.at_css('.rating-icon').content.strip
      }
    end
  end
  
  def ratings_uri
    "http://www.iihs.org/iihs/ratings/vehicle/v/#{@manufacturer}/#{@model}/#{@year}"
  end
  
  def report_uri
    "#{ratings_uri}?print-view"
  end
  
  def sanitize_manufacturer(manufacturer)
    manufacturer.gsub("Mercedes-Benz", "mercedes").parameterize
  end
  
  def sanitize_model(model)
    correct_name = MODEL_NAME[model] || model
    correct_name.parameterize.gsub("town-country", "town--n--country-minivan")
  end
  
  private
  
  def ratings_section
    fetch_ratings_page.css('.rating-list li')
  end

  def fetch_ratings_page
    Nokogiri::HTML(open(ratings_uri))
  end
  
end
