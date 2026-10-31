require "test_helper"

class PagesRoutesTest < ActionController::TestCase
  test "should resolve the home page" do
    assert_routing '/', {controller: "pages", action: "home"}
  end
 
  test "should resolve the about page" do
    assert_routing '/about', {controller: "pages", action: "about"}
  end
  
  test "should resolbe the help page" do
    assert_routing '/help', {controller: "pages", action: "help"}
  end
end