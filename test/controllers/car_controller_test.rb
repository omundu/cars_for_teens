require 'test_helper'

class CarControllerTest < ActionController::TestCase

  test "should get model" do
    get :model, {manufacturer: "Mitsubishi", model: "Outlander Sport"}

    assert_response :success
    assert_select "title", "Mitsubishi Outlander Sport"
  end

  test "should get year" do
    get :year, {manufacturer: "Mitsubishi", model: "Lancer Evolution", year: 2020}

    assert_response :success
    assert_select "title", "Mitsubishi Lancer Evolution 2020"
  end

end
