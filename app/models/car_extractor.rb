class CarExtractor
  require 'open-uri'
  
  attr_reader :cars
  
  def initialize
    @cars = get_car_array(fetch_page)
  end
  
  def get_car_array(page)
    data_cells = select_data_cells(page)
    sanitized_cells = remove_header_rows(data_cells)
    
    extract_car_information(sanitized_cells)
  end
  
  def remove_header_rows(collection)
    collection.select{|array| array.class == Array}
  end
  
  def select_by_element(html_page, element)
    html_page.css(element)
  end
  
  def select_data_cells(html_page)
    category = "vroom"
    select_by_element(html_page, 'tr').collect do |table_row|
      if table_row.at_css('th')
        category = table_row.at_css('th').text
      else
        select_by_element(table_row, 'td').map(&:text) << category
      end
    end
  end
  
  def extract_car_information(sanitized_data)
    sanitized_data.collect{|car_data| Car.new(construct_car_information(car_data))}
  end
  
  def construct_car_information(car_data)
    vehicle = car_data.first.split
    manufacturer, *model = vehicle
    years, extra_information = car_data.second.split(";")
    
    {
      manufacturer: manufacturer,
      model: model.join(" "),
      years: extract_years(years),
      suggested_price: car_data.third.delete("$,").to_i,
      extra_information: extra_information,
      category: car_data.fourth
    }
  end
  
  def extract_years(year)
    latest_year = 2014
    
    case year.length
    when 4
      Array(year.to_i)
    when 7
      first, last = year.split('-').map(&:to_i)
      Array(first.upto(last+2000))
    else
      Array(year.split.first.to_i.upto(latest_year))
    end
  end
  
  private
  
  def fetch_page
    Nokogiri::HTML(open("http://www.iihs.org/iihs/ratings/vehicles-for-teens"))
  end
  
end
