class Car
  attr_reader :manufacturer, :model, :years, :suggested_price, :extra_information
  
  def initialize(car)
    @manufacturer = car[:manufacturer]
    @model = car[:model]
    @years = car[:years]
    @suggested_price = car[:suggested_price]
    @extra_information = car[:extra_information]
  end
  
  def name
    "#{@manufacturer} #{@model}"
  end
  
  def model_years
    @years.size == 1 ? @years.first.to_s : "#{@years.first} - #{@years.last}"
  end
  
end
