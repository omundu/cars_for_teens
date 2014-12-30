require 'test_helper'

class CarTest < ActiveSupport::TestCase
  
  test "attribute reader methods" do
    car = Car.new({})
    
    [:manufacturer, :model, :years, :suggested_price, :extra_information].each do |method|
      assert car.respond_to?(method), true
    end
  end
  
  test "initialization" do
    car_attributes = {manufacturer: "Mitsubishi", model: "Lancer Evolution VI TME", years: [1999], suggested_price: "$50,000", extra_information: "Only 300 made"}
    car = Car.new(car_attributes)
    
    assert_equal car_attributes[:manufacturer], car.manufacturer
    assert_equal car_attributes[:model], car.model
    assert_equal car_attributes[:years], car.years
    assert_equal car_attributes[:suggested_price], car.suggested_price
    assert_equal car_attributes[:extra_information], car.extra_information
  end
  
  test "model years" do
    car1 = Car.new({years: [1997]})
    car2 = Car.new({years: [1997, 1998]})
    car3 = Car.new({years: [1997, 1998, 1999]})
    
    assert_equal "1997", car1.model_years
    assert_equal "1997 - 1998", car2.model_years
    assert_equal "1997 - 1999", car3.model_years
  end
  
end