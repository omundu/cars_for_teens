#Adapted from Sandeep Srinivasa at https://gist.github.com/sandys/3910840

class TableToCsv
  require 'nokogiri'
  require 'csv'
  require 'open-uri'
  
  def initialize
    write_csv(fetch_data.cars)
  end
  
  def fetch_data
    CarExtractor.new
  end
  
  def write_csv(cars)
    CSV.open(csv_path, 'w',{:col_sep => ",", :quote_char => '\'', :force_quotes => true}) do |csv|
      csv << %w{manufacturer model years suggested_price extra_information category}
      cars.each do |car|
        csv << car.to_a
      end
    end
  end
  
  def csv_path
    "public/files/output.csv"
  end
  
end
