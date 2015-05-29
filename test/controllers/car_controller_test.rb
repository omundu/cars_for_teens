require 'test_helper'

class CarControllerTest < ActionController::TestCase
  test "should get manufacturer" do
    get :model, manufacturer: "Mitsubishi", model: "Pajero"
    
    assert_response :success
  end
  
  test "should get model" do
    get :year, manufacturer: "Mitsubishi", model: "Pajero", year: "1988"
    
    assert_response :success
  end
end
