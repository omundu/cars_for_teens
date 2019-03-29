require 'test_helper'

class ManufacturerControllerTest < ActionController::TestCase

  setup do
    stub_requests
  end

  test "should get index page" do
    get :index

    assert_response :success
    assert_select "title", "Manufacturers"
  end

  test "should show a particular manufacturer" do
    get :show, :manufacturer => "Skoda"

    assert_response :success
    assert_select "title", "Skoda"
  end
end
