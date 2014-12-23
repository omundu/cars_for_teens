#Adapted from Sandeep Srinivasa at https://gist.github.com/sandys/3910840

class TableToCsv
  require 'nokogiri'
  require 'csv'
  require 'open-uri'
  
  def initialize(path="http://www.iihs.org/iihs/ratings/vehicles-for-teens")
    doc = fetch_page(path)
    write_csv(doc)
  end
  
  def write_csv(doc)
    csv = CSV.open(csv_path, 'w',{:col_sep => ",", :quote_char => '\'', :force_quotes => true})
    doc.css('tr').each do |row|
      csv << create_row_array(row)
    end
    csv.close
  end
  
  def create_row_array(row)
    row.css(element_to_collect(row)).collect do |cell|
      cell.text
    end
  end
  
  def element_to_collect(row)
    row.css('td').empty? ? 'th' : 'td'
  end
  
  def csv_path
    "public/files/output.csv"
  end
  
private
  
  def fetch_page(path)
    Nokogiri::HTML(open(path))
  end
end
