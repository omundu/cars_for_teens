require 'test_helper'

class CarExtractorTest < ActiveSupport::TestCase
  test "get car array" do
    skip "Object equality needs to be addressed"
    
    html_doc = Nokogiri::HTML("<html><body><table><tr><td>one</td><td>two</td></tr><tr><td>three</td><td>four</td></tr><tr><td>five</td><td>six</td></tr></table></body></html>")
    expected_result = [
      Car.new(manufacturer: "one", year: "two", suggested_price: 0, model: ""),
      Car.new(manufacturer: "three", year: "four", suggested_price: 0, model: ""),
      Car.new(manufacturer: "five", year: "six", suggested_price: 0, model: "")
    ]
    
    assert_equal expected_result, CarExtractor.new.get_car_array(html_doc)
  end
  
  test "remove empty arrays" do
    array1 = [[], [1, 2, 3], [4, 5, 6], [7, 8, 9]]
    array2 = [[1, 2, 3], [], [4, 5, 6], [7, 8, 9]]
    array3 = [[1, 2, 3], [4, 5, 6], [], [7, 8, 9]]
    array4 = [[1, 2, 3], [4, 5, 6], [7, 8, 9], []]
    array5 = [[], [1, 2, 3], [], [4, 5, 6], [], [7, 8, 9], []]
    array6 = [[], [], [], [1, 2, 3], [], [], [], [4, 5, 6], [], [], [], [7, 8, 9], [], [], []]
    array7 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

    [array1, array2, array3, array4, array5, array6, array7].each do |test_array|
      assert_equal [[1, 2, 3], [4, 5, 6], [7, 8, 9]], CarExtractor.new.remove_empty_arrays(test_array)
    end
  end
  
  test "handle empty arrays" do
    array1 = [[]]
    array2 = [[], [], []]
    array3 = []
    
    [array1, array2, array3].each do |test_array|
      assert_equal [], CarExtractor.new.remove_empty_arrays(test_array)
    end
  end
  
  test "select by elements" do
    html_doc = Nokogiri::HTML("<html><body><ul><li>1</li><li>2</li><li>3</li><li>4</li><li>5</li><li>6</li></ul></body></html>")
    extracted = CarExtractor.new.select_by_element(html_doc, "li").map(&:content)
    
    assert_equal ["1", "2", "3", "4", "5", "6"], extracted
  end
  
  test "select data cells" do
    skip("need to properly define the call")
    
    html_doc = Nokogiri::HTML("<html><body><table><tr><td>one</td><td>two</td></tr><tr><td>three</td><td>four</td></tr><tr><td>five</td><td>six</td></tr></table></body></html>")
    selected = CarExtractor.new.select_data_cells(html_doc)
  end
  
  test "extract car information" do
    skip("need to understand the data output")
  end
end
