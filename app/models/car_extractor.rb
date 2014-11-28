class CarExtractor
  require 'open-uri'
  
  attr_reader :cars
  
  def initialize
    @cars = get_car_array(fetch)
  end
  
  def get_car_array(page)
    page.css('tr').collect{|x| x.css('td')}.reject{|x| x.empty?}.collect{|x| [x.first.content, x[1].content, x.last.content]}
  end
  
  def remove_empty_arrays(collection)
    collection.reject{|array| array.empty?}
  end
  
  private
  
  def fetch
    Nokogiri::HTML(open("http://www.iihs.org/iihs/ratings/vehicles-for-teens"))
  end
  
end
