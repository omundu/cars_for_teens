require 'test_helper'

class ManufacturerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", "Manufacturers"
  end
  
  test "should get show" do
    get :show, {manufacturer: "skoda"}
    assert_response :success
    assert_select "title", "Skoda"
  end
end
