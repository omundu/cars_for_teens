require "test_helper"

class PagesRoutesTest < ActionController::TestCase
  test "should resolve the home page" do
    puts "what's"
    assert_routing '/', {controller: "pages", action: "home"}
  end
 
  test "should resolve the about page" do
    puts "going"
    assert_routing '/about', {controller: "pages", action: "about"}
  end
  
  test "should resolbe the help page" do
    puts "on"
    assert_routing '/help', {controller: "pages", action: "help"}
  end
end