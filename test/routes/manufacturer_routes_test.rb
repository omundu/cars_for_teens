require "test_helper"

class ManufacturerRoutesTest < ActionController::TestCase
  test "should resolve the landing" do
    assert_routing '/manufacturers', {controller: "manufacturers", action: "index"}
  end
 
  test "should resolve all other actions to the landing page" do
    ['/hi', '/test', '/foo', '/path', '/root', '/bar', '/banana', '/a'].each do |name|
      assert_routing path, {controller: "manufactuer", action: "show", manufacturer: name}
    end
  end
end