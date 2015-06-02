require 'test_helper'

class ManufacturerControllerTest < ActionController::TestCase

  test "should get index page" do
    get :index

    assert_response :success
    assert_select "title", "Manufacturers"
  end

  test "should get help" do
    get :show, :manufacturer => "Mitsubishi"
    
    assert_response :success
    assert_select "title", "Skoda"
  end
end
