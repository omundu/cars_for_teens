class Edmunds
  require 'open-uri'

  def initialize
    @options = "?fmt=json&api_key=#{ENV["EDMUNDS_KEY"]}"
    @vehicle_url = "https://api.edmunds.com/api/vehicle/v2/"
    @editorial_url = "https://api.edmunds.com/api/editorial/v2/"
    @photo_url = "https://api.edmunds.com/v1/api/vehiclephoto/service/findphotosbystyleid"
  end

  def get_manufacturer_details(options)
    manufacturer = options[:manufacturer]

    JSON.parse(open("#{@editorial_url}#{manufacturer}#{@options}").read)
  end

  def get_model_details(options)
    manufacturer = options[:manufacturer]
    model = options[:model]

    JSON.parse(open("#{@editorial_url}#{manufacturer}/#{model}#{@options}").read)
  end

  def get_model_year_syles(car)
    manufacturer = car[:manufacturer]
    model = car[:model]
    year = car[:year]

    JSON.parse(open("#{@vehicle_url}#{manufacturer}/#{model}/#{year}#{@options}").read)
  end

  def get_style_images(style_id)
    JSON.parse(open("#{@photo_url}#{@options}&styleId=#{style_id}").read)
  end

end
