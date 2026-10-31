require "test_helper"

class CarRoutesTest < ActionController::TestCase
  test "should resolve the model url" do
    assert_routing 'manufacturer/fiat/ka', {controller: "car", action: "model", manufacturer: "fiat", model: "ka"}
  end
 
  test "should resolve the model year url" do
    assert_routing 'manufacturer/kia/rio/1010', {controller: "car", action: "year", manufacturer: "kia", model: "rio", year: "1010"}
  end
end