require 'test_helper'

class CarTest < ActiveSupport::TestCase
  CAR_ATTRIBUTES = {manufacturer: "Mitsubishi", model: "Lancer Evolution VI TME", years: [1999], suggested_price: "$50,000", extra_information: "Only 300 made", category: "RALLY CAR"}
  
  test "attribute reader methods" do
    car = Car.new({})
    
    [:manufacturer, :model, :years, :suggested_price, :extra_information, :category].each do |attribute|
      assert car.respond_to?(attribute), true
    end
  end
  
  test "initialization" do
    car = Car.new(CAR_ATTRIBUTES)
    
    assert_equal CAR_ATTRIBUTES[:manufacturer], car.manufacturer
    assert_equal CAR_ATTRIBUTES[:model], car.model
    assert_equal CAR_ATTRIBUTES[:years], car.years
    assert_equal CAR_ATTRIBUTES[:suggested_price], car.suggested_price
    assert_equal CAR_ATTRIBUTES[:extra_information], car.extra_information
    assert_equal CAR_ATTRIBUTES[:category], car.category
    
    car = Car.new({})
    
    [:manufacturer, :model, :years, :suggested_price, :extra_information, :category].each do |attribute|
      assert_nil car.send(attribute)
    end
    
    car = Car.new({manufacturer: "Subaru", model: "Imprezza WRX B22"})
    
    assert_equal "Subaru", car.manufacturer
    assert_equal"Imprezza WRX B22", car.model
    [:suggested_price, :extra_information, :category].each do |attribute|
      assert_nil car.send(attribute)
    end
    
  end
  
  test "name" do
    car = Car.new(CAR_ATTRIBUTES)
    
    assert_equal "Mitsubishi Lancer Evolution VI TME", car.name
  end
  
  test "model years" do
    car0 = Car.new({})
    car1 = Car.new({years: [1997]})
    car2 = Car.new({years: [1997, 1998]})
    car3 = Car.new({years: [1997, 1998, 1999]})
    
    assert_equal "", car0.model_years
    assert_equal "1997", car1.model_years
    assert_equal "1997 - 1998", car2.model_years
    assert_equal "1997 - 1999", car3.model_years
  end
  
  test "to_s" do
    car = Car.new(CAR_ATTRIBUTES)
    
    assert_equal "Mitsubishi Lancer Evolution VI TME 1999", car.to_s
  end
  
  test "to_a" do
    car = Car.new(CAR_ATTRIBUTES)
    
    assert_equal ["Mitsubishi", "Lancer Evolution VI TME", "1999", "$50,000", "Only 300 made", "RALLY CAR"], car.to_a
  end
  
end