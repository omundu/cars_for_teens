class CarExtractor
  require 'open-uri'
  
  attr_reader :cars
  
  def initialize
    @cars = get_car_array(fetch_page)
  end
  
  def get_car_array(page)
    data_cells = select_data_cells(page)
    sanitized_cells = remove_empty_arrays(data_cells)
    
    extract_car_information(sanitized_cells)
  end
  
  def remove_empty_arrays(collection)
    collection.reject{|array| array.empty?}
  end
  
  def select_by_element(html_page, element)
    html_page.css(element)
  end
  
  def select_data_cells(html_page)
    select_by_element(html_page, 'tr').collect{|table_row| select_by_element(table_row, 'td')}
  end
  
  def extract_car_information(sanitized_data)
    sanitized_data.collect{|row| Car.new(construct_car_information(row))}
  end
  
  def construct_car_information(row)
    vehicle = row.first.content.split
    manufacturer, *model = vehicle
    years, extra_information = row[1].content.split(";")
    
    {
      manufacturer: manufacturer,
      model: model.join(" "),
      years: extract_years(years),
      suggested_price: row.last.content.delete("$,").to_i,
      extra_information: extra_information
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
