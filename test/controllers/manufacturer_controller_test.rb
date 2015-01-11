require 'test_helper'

class ManufacturerControllerTest < ActionController::TestCase
  test "should get index page" do
    get :manufacturers
    assert_response :success
    assert_select "title", "Manufacturers"
  end
  
  test "should get help" do
    get "manufacturer/mitsubishi"
    assert_response :success
    assert_select "title", "Mitsubishi"
  end
end
