require 'open-uri'

class SafetyRatings

  def initialize(options)
    @manufacturer = sanitize_manufacturer(options[:manufacturer])
    @model = sanitize_model(options[:model])
    @year = options[:year]
  end

  def cached_ratings
    Rails.cache.fetch([@manufacturer, @model, @year]) { ratings }
  end

  def ratings
    ratings_section.inject([]) do |ratings_array, rating|
      case rating.at_css('.rating-caption').content.strip
      when 'Small overlap front'
        ratings_array += []
      when 'Passenger-side'
        ratings_array += [{
          rating_type: 'Small overlap front: Passenger-side',
          rating_value: rating.at_css('.rating-icon').content.strip.presence || 'NR'
        }]
      when 'Driver-side'
        ratings_array += [{
          rating_type: 'Small overlap front: Driver-side',
          rating_value: rating.at_css('.rating-icon').content.strip.presence || 'NR'
        }]
      else
        ratings_array += [
          {
            rating_type: rating.at_css('.rating-caption').content.strip,
            rating_value: rating.at_css('.rating-icon').content.strip
          }
        ]
      end
    end
  end

  def ratings_uri
    "#{IIHS_RATINGS_URL}/#{@manufacturer}/#{@model}/#{@year}"
  end

  def report_uri
    "#{ratings_uri}?print-view"
  end

  def sanitize_manufacturer(manufacturer)
    manufacturer.gsub("Mercedes-Benz", "mercedes").parameterize
  end

  def sanitize_model(model)
    correct_name = IIHS_MODEL_NAME[model] || model
    correct_name.parameterize.gsub("town-country", "town--n--country-minivan")
  end

  private

  def ratings_section
    fetch_ratings_page.css('.rating-list li')
  end

  def fetch_ratings_page
    Nokogiri::HTML(URI.open(ratings_uri))
  end

end
