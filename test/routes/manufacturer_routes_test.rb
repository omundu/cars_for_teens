require "test_helper"

class ManufacturerRoutesTest < ActionController::TestCase
  test "should resolve the landing" do
    assert_routing '/manufacturers', {controller: "manufacturer", action: "index"}
  end
 
  test "should resolve all other actions to the landing page" do
    ['hi', 'test', 'foo', 'a', 'mer-ben', 'FCA', 'bananarama', 'a_b-b_a'].each do |name|
      assert_routing "manufacturer/#{name}", {controller: "manufacturer", action: "show", manufacturer: name}
    end
  end
end