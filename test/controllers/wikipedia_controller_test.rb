require 'test_helper'

class WikipediaControllerTest < ActionController::TestCase
  test "should get manufacturer" do
    get :manufacturer, manufacturer: "Mitsubishi"
    
    assert_response :success
    assert_template :partial => false
  end
  
  test "should get model" do
    skip("sanitizing name gets nil [] error, need to stub data")
    get :model, manufacturer: "Mitsubishi", model: "Parejo"
    
    assert_response :success
    assert_template :partial => false
  end
end
