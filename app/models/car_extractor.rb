class CarExtractor
  require 'open-uri'
  
  attr_reader :cars
  
  def initialize
    @page = fetch
    @cars = @page.css('tr').collect{|x| [x.text]}
  end
  
  protected
  
  def fetch
    Nokogiri::HTML(open("http://www.iihs.org/iihs/ratings/vehicles-for-teens"))
  end
  
end
