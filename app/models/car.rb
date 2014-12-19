class Car
  attr_reader :manufacturer, :model, :year, :suggested_price, :extra_information
  
  def initialize(car)
    @manufacturer = car[:manufacturer]
    @model = car[:model]
    @year = car[:year]
    @suggested_price = car[:suggested_price]
    @extra_information = car[:extra_information]
  end
  
  def name
    "#{@manufacturer} #{@model}"
  end
  
end
