class Car
  attr_reader :manufacturer, :model, :years, :suggested_price, :extra_information
  
  def initialize(car_attributes)
    @manufacturer =car_attributes[:manufacturer]
    @model = car_attributes[:model]
    @years = car_attributes[:years]
    @suggested_price = car_attributes[:suggested_price]
    @extra_information = car_attributes[:extra_information]
  end
  
  def name
    "#{@manufacturer} #{@model}"
  end
  
  def model_years
    case 
    when @years.nil?
      ""
    when @years.size == 1
      @years.first.to_s 
    else
      "#{@years.first} - #{@years.last}"
    end
  end
  
  def to_s
    "#{name} #{model_years}"
  end
  
end
