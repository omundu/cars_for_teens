class SafetyRatings
  require 'open-uri'

  def initialize(options)
    @manufacturer = sanitize_manufacturer(options[:manufacturer])
    @model = sanitize_model(options[:model])
    @year = options[:year]
  end
  
  def cached_ratings
    Rails.cache.fetch([@manufacturer, @model, @year]) { ratings }
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
    manufacturer.parameterize
  end
  
  def sanitize_model(model)
    model.parameterize
  end
  
  private
  
  def ratings_section
    fetch_ratings_page.css('.rating-list li')
  end

  def fetch_ratings_page
    Nokogiri::HTML(open(ratings_uri))
  end
  
end
