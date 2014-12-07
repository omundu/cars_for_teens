class Car
  attr_reader :manufacturer, :model, :year, :suggested_price
  
  def initialize(car)
    @manufacturer = car[:manufacturer]
    @model = car[:model]
    @year = car[:year]
    @suggested_price = car[:suggested_price]
  end
  
end
