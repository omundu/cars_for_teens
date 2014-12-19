require 'test_helper'

class CarTest < ActiveSupport::TestCase
  
  test "attribute reader methods" do
    car = Car.new({})
    
    [:manufacturer, :model, :year, :suggested_price, :extra_information].each do |method|
      assert car.respond_to?(method), true
    end
  end
  
  test "initialization" do
    car_attributes = {manufacturer: "Mitsubishi", model: "Lancer Evolution VI TME", year: "1999", suggested_price: "$50,000", extra_information: "Only 300 made"}
    car = Car.new(car_attributes)
    
    assert_equal car_attributes[:manufacturer], car.manufacturer
    assert_equal car_attributes[:model], car.model
    assert_equal car_attributes[:year], car.year
    assert_equal car_attributes[:suggested_price], car.suggested_price
    assert_equal car_attributes[:extra_information], car.extra_information
  end
  
end