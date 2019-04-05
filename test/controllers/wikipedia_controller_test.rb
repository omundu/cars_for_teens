require 'test_helper'

class WikipediaControllerTest < ActionController::TestCase

  setup do
    stub_requests
  end

  test "should get manufacturer" do
    get :manufacturer, params: {manufacturer: "Mitsubishi"}

    assert_response :success
    assert_template :partial => false
  end

  test "should get model" do
    get :model, params: {manufacturer: "Mitsubishi", model: "Pajero"}

    assert_response :success
    assert_template :partial => false
  end

end
