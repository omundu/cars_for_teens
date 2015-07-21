require 'test_helper'

class WikipediaControllerTest < ActionController::TestCase
  test "should get manufacturer" do
    get :manufacturer, manufacturer: "Mitsubishi"

    assert_response :success
    assert_template :partial => false
  end

  test "should get model" do
    get :model, manufacturer: "Mitsubishi", model: "Pajero"

    assert_response :success
    assert_template :partial => false
  end
end
